<#
.SYNOPSIS
    Automated VMSS Patching Script - Works in both Local and Azure Automation Account environments

.DESCRIPTION
    This script automates the process of patching VM Scale Sets across all Azure subscriptions.
    It finds VMSS with specified tags, creates temporary VMs for patching, applies updates,
    creates new images, and updates the VMSS to use the latest patched images.
    
    The script automatically detects if it's running in Azure Automation Account or locally:
    - Azure Automation Account: Uses Managed Identity for authentication
    - Local execution: Uses interactive login or device code authentication

.PARAMETER TagName
    The tag name to filter VMSS (default: "PatchingEnabled")

.PARAMETER TagValue
    The tag value to filter VMSS (default: "true")

.PARAMETER UseDeviceCode
    Use device code authentication for local testing (only applies to local execution)

.EXAMPLE
    # For local execution
    .\vmss_patching.ps1 -TagName "AutoPatch" -TagValue "enabled"
    
.EXAMPLE
    # For local execution with device code
    .\vmss_patching.ps1 -UseDeviceCode
    
.NOTES
    For Azure Automation Account deployment:
    1. Upload this script as a PowerShell runbook
    2. Ensure the following AzureRM modules are installed in the Automation Account:
       - AzureRM.Profile
       - AzureRM.Resources  
       - AzureRM.Compute
       - AzureRM.Network
    3. Enable system-assigned managed identity for the Automation Account
    4. Grant the managed identity Contributor permissions on target subscriptions
#>

param(
    [Parameter(Mandatory = $false)]
    [string]$TagName = "PatchingEnabled",
    
    [Parameter(Mandatory = $false)]
    [string]$TagValue = "true",
    
    [Parameter(Mandatory = $false)]
    [switch]$UseDeviceCode = $false
)

# Check and import required modules
if ($env:AUTOMATION_ASSET_ENDPOINT) {
    # Running in Azure Automation Account - modules should be pre-installed
    Write-Output "Running in Azure Automation Account - checking for required modules..."
    $requiredModules = @('AzureRM.Profile', 'AzureRM.Resources', 'AzureRM.Compute', 'AzureRM.Network')
    
    foreach ($module in $requiredModules) {
        try {
            Write-Output "Importing module: $module"
            Import-Module $module -Force -ErrorAction Stop
            Write-Output "Successfully imported module: $module"
        }
        catch {
            $errorMsg = @"
Failed to import module $module in Azure Automation Account.

SOLUTION: Install the missing module in your Automation Account:
1. Go to your Automation Account in Azure Portal
2. Navigate to 'Modules' under 'Shared Resources'
3. Click 'Browse Gallery'
4. Search for '$module' and install it
5. Wait for installation to complete (this may take several minutes)
6. Retry running this runbook

Required modules for this script:
- AzureRM.Profile (install this first)
- AzureRM.Resources
- AzureRM.Compute
- AzureRM.Network

Error details: $($_.Exception.Message)
"@
            Write-Error $errorMsg
            exit 1
        }
    }
}
else {
    # Running locally - check and install modules if needed
    Write-Host "Running locally - checking for required modules..." -ForegroundColor Yellow
    $requiredModules = @('AzureRM.Profile', 'AzureRM.Resources', 'AzureRM.Compute', 'AzureRM.Network')
    
    foreach ($module in $requiredModules) {
        try {
            Write-Host "Checking for module: $module" -ForegroundColor Yellow
            if (Get-Module -ListAvailable -Name $module) {
                Import-Module $module -Force
                Write-Host "Successfully imported module: $module" -ForegroundColor Green
            } else {
                Write-Error "Module $module is not installed. Please install it using: Install-Module -Name $module"
                exit 1
            }
        }
        catch {
            Write-Error "Failed to import module $module. Error: $($_.Exception.Message)"
            exit 1
        }
    }
}
# Global variables
$ErrorActionPreference = "Stop"
$VerbosePreference = "Continue"

# Log file path - use temp directory that works in both local and automation account
$LogFile = if ($env:AUTOMATION_ASSET_ENDPOINT) {
    # In Azure Automation Account
    "C:\Temp\vmss_patching_$(Get-Date -Format 'yyyyMMdd_HHmmss').log"
} else {
    # Local testing
    "C:\Temp\vmss_patching_$(Get-Date -Format 'yyyyMMdd_HHmmss').log"
}

# Hardcoded values for resource naming
$ResourceGroupPrefix = "rg-temp-patching"
$VMNamePrefix = "vm-temp-patch"
$ImageNamePrefix = "img-patched"

# Ensure log directory exists
$tempDir = if ($env:AUTOMATION_ASSET_ENDPOINT) {
    # In Azure Automation Account, use system temp
    $env:TEMP
} else {
    # Local testing
    "C:\Temp"
}

if (!(Test-Path $tempDir)) {
    New-Item -ItemType Directory -Path $tempDir -Force
}

# Update log file path to use the determined temp directory
$LogFile = "$tempDir\vmss_patching_$(Get-Date -Format 'yyyyMMdd_HHmmss').log"

#region Logging Functions
function Write-Log {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Message,
        
        [Parameter(Mandatory = $false)]
        [ValidateSet("INFO", "WARNING", "ERROR", "SUCCESS")]
        [string]$Level = "INFO"
    )
    
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logMessage = "[$timestamp] [$Level] $Message"
    
    # Write to console with color coding
    switch ($Level) {
        "INFO" { 
            Write-Host $logMessage -ForegroundColor White
            if ($env:AUTOMATION_ASSET_ENDPOINT) { Write-Output $logMessage }
        }
        "WARNING" { 
            Write-Host $logMessage -ForegroundColor Yellow
            if ($env:AUTOMATION_ASSET_ENDPOINT) { Write-Warning $logMessage }
        }
        "ERROR" { 
            Write-Host $logMessage -ForegroundColor Red
            if ($env:AUTOMATION_ASSET_ENDPOINT) { Write-Error $logMessage }
        }
        "SUCCESS" { 
            Write-Host $logMessage -ForegroundColor Green
            if ($env:AUTOMATION_ASSET_ENDPOINT) { Write-Output $logMessage }
        }
    }
    
    # Write to log file
    try {
        Add-Content -Path $LogFile -Value $logMessage
    }
    catch {
        # In case log file is not accessible, just continue
        Write-Output "Failed to write to log file: $($_.Exception.Message)"
    }
}
#endregion

#region Azure Authentication
function Connect-ToAzure {
    param(
        [Parameter(Mandatory = $false)]
        [switch]$UseDeviceCode = $false
    )
    
    try {
        # Check if running in Azure Automation (has AUTOMATION_ASSET_ENDPOINT environment variable)
        if ($env:AUTOMATION_ASSET_ENDPOINT) {
            Write-Log "Connecting to Azure using Managed Identity (Azure Automation)..."
            $context = Connect-AzureRmAccount -Identity
        }
        else {
            # Check if already connected (for local testing)
            try {
                $currentContext = Get-AzureRmContext
                if ($currentContext -and $currentContext.Account) {
                    Write-Log "Already connected to Azure" -Level "SUCCESS"
                    Write-Log "Account: $($currentContext.Account.Id)"
                    Write-Log "Subscription: $($currentContext.Subscription.Name)"
                    return $true
                }
            }
            catch {
                # Not connected, proceed with authentication
            }
            
            # For local testing
            if ($UseDeviceCode) {
                Write-Log "Connecting to Azure using device code authentication..."
                $context = Connect-AzureRmAccount -UseDeviceAuthentication
            }
            else {
                Write-Log "Connecting to Azure using interactive login (local testing)..."
                Write-Log "If this hangs, cancel and run the script with -UseDeviceCode parameter"
                $context = Connect-AzureRmAccount
            }
        }
        
        if ($context) {
            Write-Log "Successfully connected to Azure" -Level "SUCCESS"
            Write-Log "Account: $($context.Context.Account.Id)"
            Write-Log "Subscription: $($context.Context.Subscription.Name)"
            return $true
        }
        else {
            Write-Log "Failed to connect to Azure" -Level "ERROR"
            return $false
        }
    }
    catch {
        Write-Log "Error connecting to Azure: $($_.Exception.Message)" -Level "ERROR"
        Write-Log "Try running the script with device code authentication or ensure you're logged in via Azure CLI" -Level "WARNING"
        return $false
    }
}
#endregion

#region Subscription Management
function Get-AllSubscriptions {
    try {
        Write-Log "Retrieving all accessible subscriptions..."
        $subscriptions = Get-AzureRmSubscription | Where-Object { $_.State -eq "Enabled" }
        
        Write-Log "Found $($subscriptions.Count) enabled subscriptions" -Level "SUCCESS"
        return $subscriptions
    }
    catch {
        Write-Log "Error retrieving subscriptions: $($_.Exception.Message)" -Level "ERROR"
        return $null
    }
}
#endregion

#region VMSS Discovery
function Get-VMSSWithTag {
    param(
        [Parameter(Mandatory = $true)]
        [string]$SubscriptionId,
        
        [Parameter(Mandatory = $true)]
        [string]$TagName,
        
        [Parameter(Mandatory = $true)]
        [string]$TagValue
    )
    
    try {
        Write-Log "Searching for VMSS with tag '$TagName=$TagValue' and gallery images in subscription: $SubscriptionId"
        
        Select-AzureRmSubscription -SubscriptionId $SubscriptionId | Out-Null
        
        # Get all VMSS in the subscription
        $allVmss = Get-AzureRmVmss
        
        $vmssList = @()
        foreach ($vmss in $allVmss) {
            # Check if VMSS has the required tag
            if ($vmss.Tags[$TagName] -eq $TagValue) {
                Write-Log "Found VMSS '$($vmss.Name)' with tag '$TagName=$TagValue'"
                
                # Check if VMSS uses gallery image (not marketplace image)
                $imageReference = $vmss.VirtualMachineProfile.StorageProfile.ImageReference
                
                # Gallery images have an ID that contains "/galleries/" or "/images/"
                # Marketplace images have Publisher, Offer, Sku properties
                $isGalleryImage = $false
                
                if (![string]::IsNullOrEmpty($imageReference.Id)) {
                    # Check if the ID contains gallery or image resource paths
                    if ($imageReference.Id -match "/galleries/|/images/|Microsoft.Compute/galleries|Microsoft.Compute/images") {
                        $isGalleryImage = $true
                        Write-Log "VMSS '$($vmss.Name)' uses gallery image: $($imageReference.Id)"
                    }
                }
                
                # Only add VMSS that use gallery images
                if ($isGalleryImage) {
                    $vmssList += $vmss
                    Write-Log "Added VMSS '$($vmss.Name)' - uses gallery image" -Level "SUCCESS"
                }
                else {
                    Write-Log "Skipped VMSS '$($vmss.Name)' - uses marketplace image (Publisher: $($imageReference.Publisher), Offer: $($imageReference.Offer), Sku: $($imageReference.Sku))" -Level "WARNING"
                }
            }
        }
        
        Write-Log "Found $($vmssList.Count) VMSS with specified tag and gallery images in subscription: $SubscriptionId" -Level "SUCCESS"
        return $vmssList
    }
    catch {
        Write-Log "Error searching for VMSS in subscription $SubscriptionId : $($_.Exception.Message)" -Level "ERROR"
        return @()
    }
}
#endregion

#region Image Management
function Get-VMSSImageDetails {
    param(
        [Parameter(Mandatory = $true)]
        $VMSS
    )
    
    try {
        $imageReference = $VMSS.VirtualMachineProfile.StorageProfile.ImageReference
        
        $imageDetails = @{
            Publisher = $imageReference.Publisher
            Offer = $imageReference.Offer
            Sku = $imageReference.Sku
            Version = $imageReference.Version
            Id = $imageReference.Id
            IsCustomImage = ![string]::IsNullOrEmpty($imageReference.Id)
        }
        
        Write-Log "Retrieved image details for VMSS: $($VMSS.Name)"
        return $imageDetails
    }
    catch {
        Write-Log "Error retrieving image details for VMSS $($VMSS.Name): $($_.Exception.Message)" -Level "ERROR"
        return $null
    }
}
#endregion

#region Temporary VM Management
function New-TempResourceGroup {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Location,
        
        [Parameter(Mandatory = $true)]
        [string]$VMSSName
    )
    
    $rgName = "$ResourceGroupPrefix-$VMSSName-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
    
    try {
        Write-Log "Creating temporary resource group: $rgName"
        $rg = New-AzureRmResourceGroup -Name $rgName -Location $Location -Force
        Write-Log "Created temporary resource group: $rgName" -Level "SUCCESS"
        return $rg.ResourceGroupName
    }
    catch {
        Write-Log "Error creating resource group $rgName : $($_.Exception.Message)" -Level "ERROR"
        return $null
    }
}

function New-TempVM {
    param(
        [Parameter(Mandatory = $true)]
        [string]$ResourceGroupName,
        
        [Parameter(Mandatory = $true)]
        [string]$Location,
        
        [Parameter(Mandatory = $true)]
        $ImageDetails,
        
        [Parameter(Mandatory = $true)]
        [string]$VMSSName,
        
        [Parameter(Mandatory = $true)]
        $VMSSSize
    )
    
    $vmName = "$VMNamePrefix-$VMSSName-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
    $networkName = "vnet-temp-$VMSSName"
    $subnetName = "subnet-temp-$VMSSName"
    $publicIpName = "pip-temp-$VMSSName"
    $networkSecurityGroupName = "nsg-temp-$VMSSName"
    $networkInterfaceName = "nic-temp-$VMSSName"
    
    try {
        Write-Log "Creating temporary VM: $vmName"
        
        # Create network security group and rule
        $rdpRule = New-AzureRmNetworkSecurityRuleConfig -Name "RDP-Rule" -Description "Allow RDP" `
            -Access Allow -Protocol Tcp -Direction Inbound -Priority 100 `
            -SourceAddressPrefix Internet -SourcePortRange * `
            -DestinationAddressPrefix * -DestinationPortRange 3389
            
        $winrmRule = New-AzureRmNetworkSecurityRuleConfig -Name "WinRM-Rule" -Description "Allow WinRM" `
            -Access Allow -Protocol Tcp -Direction Inbound -Priority 101 `
            -SourceAddressPrefix Internet -SourcePortRange * `
            -DestinationAddressPrefix * -DestinationPortRange 5985,5986
        
        $nsg = New-AzureRmNetworkSecurityGroup -ResourceGroupName $ResourceGroupName `
            -Location $Location -Name $networkSecurityGroupName `
            -SecurityRules $rdpRule, $winrmRule
        
        # Create a subnet configuration
        $subnetConfig = New-AzureRmVirtualNetworkSubnetConfig -Name $subnetName -AddressPrefix 192.168.1.0/24 `
            -NetworkSecurityGroup $nsg
        
        # Create a virtual network
        $vnet = New-AzureRmVirtualNetwork -ResourceGroupName $ResourceGroupName -Location $Location `
            -Name $networkName -AddressPrefix 192.168.0.0/16 -Subnet $subnetConfig
        
        # Create a public IP address
        $publicIp = New-AzureRmPublicIpAddress -ResourceGroupName $ResourceGroupName -Location $Location `
            -Name $publicIpName -AllocationMethod Static -IdleTimeoutInMinutes 4
        
        # Create a network interface
        $nic = New-AzureRmNetworkInterface -Name $networkInterfaceName -ResourceGroupName $ResourceGroupName `
            -Location $Location -SubnetId $vnet.Subnets[0].Id -PublicIpAddressId $publicIp.Id `
            -NetworkSecurityGroupId $nsg.Id
        
        # Generate random password
        $password = -join ((65..90) + (97..122) + (48..57) | Get-Random -Count 12 | ForEach-Object {[char]$_})
        $securePassword = ConvertTo-SecureString $password -AsPlainText -Force
        $cred = New-Object System.Management.Automation.PSCredential ("tempuser", $securePassword)
        
        # Create VM configuration
        $vmConfig = New-AzureRmVMConfig -VMName $vmName -VMSize $VMSSSize
        
        # Set the image - with detailed logging
        Write-Log "Image Details - IsCustomImage: $($ImageDetails.IsCustomImage)"
        Write-Log "Image Details - Id: $($ImageDetails.Id)"
        Write-Log "Image Details - Publisher: $($ImageDetails.Publisher)"
        Write-Log "Image Details - Offer: $($ImageDetails.Offer)"
        Write-Log "Image Details - Sku: $($ImageDetails.Sku)"
        Write-Log "Image Details - Version: $($ImageDetails.Version)"
        
        if ($ImageDetails.IsCustomImage) {
            Write-Log "Using custom image ID: $($ImageDetails.Id)"
            # Try to verify the image exists first
            try {
                # For gallery images, we might need different approach
                if ($ImageDetails.Id -like "*galleries*") {
                    Write-Log "Detected gallery image, attempting to use directly..."
                    # Parse gallery image path
                    $galleryPath = $ImageDetails.Id
                    Write-Log "Gallery path: $galleryPath"
                    
                    # Check if the path already includes version
                    if ($galleryPath -like "*/versions/*") {
                        Write-Log "Gallery path already includes version, using directly..."
                        $vmConfig = Set-AzureRmVMSourceImage -VM $vmConfig -Id $ImageDetails.Id
                    }
                    else {
                        Write-Log "Gallery path missing version, attempting to find latest version..."
                        # Extract components from gallery path
                        $pathParts = $galleryPath -split '/'
                        $subscriptionId = $pathParts[2]
                        $resourceGroupName = $pathParts[4]
                        $galleryName = $pathParts[8]
                        $imageName = $pathParts[10]
                        
                        try {
                            # Try to get the latest version of the gallery image
                            $galleryImageVersions = Get-AzureRmGalleryImageVersion -ResourceGroupName $resourceGroupName -GalleryName $galleryName -GalleryImageDefinitionName $imageName
                            
                            if ($galleryImageVersions -and $galleryImageVersions.Count -gt 0) {
                                # Sort by name and get the latest version
                                $latestVersion = ($galleryImageVersions | Sort-Object Name -Descending)[0]
                                $fullGalleryPath = "$galleryPath/versions/$($latestVersion.Name)"
                                Write-Log "Found latest gallery image version: $($latestVersion.Name)"
                                Write-Log "Using full gallery path: $fullGalleryPath"
                                
                                $vmConfig = Set-AzureRmVMSourceImage -VM $vmConfig -Id $fullGalleryPath
                            }
                            else {
                                Write-Log "No gallery image versions found" -Level "WARNING"
                                throw "No gallery image versions found"
                            }
                        }
                        catch {
                            Write-Log "Error getting gallery image versions: $($_.Exception.Message)" -Level "WARNING"
                            throw "Failed to get gallery image versions"
                        }
                    }
                }
                else {
                    # Regular custom image
                    $rgName = ($ImageDetails.Id -split '/')[4]  # Extract resource group from ID
                    $imageName = ($ImageDetails.Id -split '/')[-1]  # Extract image name from ID
                    
                    $imageInfo = Get-AzureRmImage -ResourceGroupName $rgName -ImageName $imageName
                    Write-Log "Image verification successful: $($imageInfo.Name)"
                    $vmConfig = Set-AzureRmVMSourceImage -VM $vmConfig -Id $ImageDetails.Id
                }
            }
            catch {
                Write-Log "Error using custom image: $($_.Exception.Message)" -Level "ERROR"
                Write-Log "Falling back to default Windows Server 2019 image..." -Level "WARNING"
                
                # Fallback to a known working Windows image
                $vmConfig = Set-AzureRmVMSourceImage -VM $vmConfig -PublisherName "MicrosoftWindowsServer" `
                    -Offer "WindowsServer" -Skus "2019-Datacenter" -Version "latest"
            }
        }
        else {
            Write-Log "Using marketplace image: $($ImageDetails.Publisher)/$($ImageDetails.Offer)/$($ImageDetails.Sku)/$($ImageDetails.Version)"
            $vmConfig = Set-AzureRmVMSourceImage -VM $vmConfig -PublisherName $ImageDetails.Publisher `
                -Offer $ImageDetails.Offer -Skus $ImageDetails.Sku -Version $ImageDetails.Version
        }
        
        # Set the operating system configuration
        $vmConfig = Set-AzureRmVMOperatingSystem -VM $vmConfig -Windows -ComputerName $vmName `
            -Credential $cred -ProvisionVMAgent -EnableAutoUpdate
        
        # Add the network interface
        $vmConfig = Add-AzureRmVMNetworkInterface -VM $vmConfig -Id $nic.Id
        
        # Set the boot diagnostics storage account
        $vmConfig = Set-AzureRmVMBootDiagnostics -VM $vmConfig -Disable
        
        # Create the VM
        $vm = New-AzureRmVM -ResourceGroupName $ResourceGroupName -Location $Location -VM $vmConfig
        
        Write-Log "Created temporary VM: $vmName" -Level "SUCCESS"
        Write-Log "VM Admin Username: tempuser"
        Write-Log "VM Admin Password: $password"
        
        return @{
            VM = $vm
            Name = $vmName
            ResourceGroupName = $ResourceGroupName
            AdminUsername = "tempuser"
            AdminPassword = $password
            PublicIpAddress = (Get-AzureRmPublicIpAddress -ResourceGroupName $ResourceGroupName -Name $publicIpName).IpAddress
        }
    }
    catch {
        Write-Log "Error creating temporary VM: $($_.Exception.Message)" -Level "ERROR"
        return $null
    }
}
#endregion

#region Patching
function Install-VMUpdates {
    param(
        [Parameter(Mandatory = $true)]
        $VMDetails
    )
    
    try {
        Write-Log "Installing updates on VM: $($VMDetails.Name)"
        
        # Create custom script to install updates
        $updateScript = @'
# Enable Windows Update service
Set-Service -Name wuauserv -StartupType Automatic
Start-Service -Name wuauserv

# Install PSWindowsUpdate module
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
Install-Module PSWindowsUpdate -Force

# Install all available updates
Import-Module PSWindowsUpdate
Get-WUInstall -AcceptAll -AutoReboot:$false -Verbose

# Check if reboot is required
$rebootRequired = Get-WURebootStatus -Silent
if ($rebootRequired) {
    Write-Output "Reboot required after updates"
    shutdown /r /t 60 /c "Rebooting after Windows Updates"
}
else {
    Write-Output "No reboot required"
}
'@
        
        # Save script to temp file
        $scriptPath = "$tempDir\install-updates.ps1"
        $updateScript | Out-File -FilePath $scriptPath -Encoding UTF8
        
        # Run the update script on the VM
        $result = Invoke-AzureRmVMRunCommand -ResourceGroupName $VMDetails.ResourceGroupName `
            -VMName $VMDetails.Name -CommandId 'RunPowerShellScript' `
            -ScriptPath $scriptPath
        
        Write-Log "Update installation completed on VM: $($VMDetails.Name)" -Level "SUCCESS"
        Write-Log "Update output: $($result.Value[0].Message)"
        
        # Wait for potential reboot
        if ($result.Value[0].Message -like "*Reboot required*") {
            Write-Log "Waiting for VM reboot to complete..."
            Start-Sleep -Seconds 120
            
            # Wait for VM to be running again
            do {
                Start-Sleep -Seconds 30
                $vmStatus = Get-AzureRmVM -ResourceGroupName $VMDetails.ResourceGroupName -Name $VMDetails.Name -Status
                $powerState = ($vmStatus.Statuses | Where-Object { $_.Code -like "PowerState/*" }).DisplayStatus
                Write-Log "VM Power State: $powerState"
            } while ($powerState -ne "VM running")
            
            Write-Log "VM reboot completed" -Level "SUCCESS"
        }
        
        return $true
    }
    catch {
        Write-Log "Error installing updates on VM $($VMDetails.Name): $($_.Exception.Message)" -Level "ERROR"
        return $false
    }
}
#endregion

#region Image Creation
function New-VMImage {
    param(
        [Parameter(Mandatory = $true)]
        $VMDetails,
        
        [Parameter(Mandatory = $true)]
        [string]$VMSSName
    )
    
    try {
        $imageName = "$ImageNamePrefix-$VMSSName-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
        
        Write-Log "Creating image from VM: $($VMDetails.Name)"
        
        # Stop and deallocate the VM
        Write-Log "Stopping VM: $($VMDetails.Name)"
        Stop-AzureRmVM -ResourceGroupName $VMDetails.ResourceGroupName -Name $VMDetails.Name -Force
        
        # Generalize the VM
        Write-Log "Generalizing VM: $($VMDetails.Name)"
        Set-AzureRmVM -ResourceGroupName $VMDetails.ResourceGroupName -Name $VMDetails.Name -Generalized
        
        # Get the VM
        $vm = Get-AzureRmVM -ResourceGroupName $VMDetails.ResourceGroupName -Name $VMDetails.Name
        
        # Create the image configuration
        $imageConfig = New-AzureRmImageConfig -Location $vm.Location -SourceVirtualMachineId $vm.Id
        
        # Create the image
        $image = New-AzureRmImage -Image $imageConfig -ImageName $imageName -ResourceGroupName $VMDetails.ResourceGroupName
        
        Write-Log "Created image: $imageName" -Level "SUCCESS"
        return $image
    }
    catch {
        Write-Log "Error creating image from VM $($VMDetails.Name): $($_.Exception.Message)" -Level "ERROR"
        return $null
    }
}
#endregion

#region VMSS Update
function Update-VMSSImage {
    param(
        [Parameter(Mandatory = $true)]
        $VMSS,
        
        [Parameter(Mandatory = $true)]
        $NewImage
    )
    
    try {
        Write-Log "Updating VMSS: $($VMSS.Name) with new image: $($NewImage.Name)"
        
        # Update the VMSS model with the new image
        $VMSS.VirtualMachineProfile.StorageProfile.ImageReference.Id = $NewImage.Id
        $VMSS.VirtualMachineProfile.StorageProfile.ImageReference.Publisher = $null
        $VMSS.VirtualMachineProfile.StorageProfile.ImageReference.Offer = $null
        $VMSS.VirtualMachineProfile.StorageProfile.ImageReference.Sku = $null
        $VMSS.VirtualMachineProfile.StorageProfile.ImageReference.Version = $null
        
        # Update the VMSS
        Update-AzureRmVmss -ResourceGroupName $VMSS.ResourceGroupName -Name $VMSS.Name -VirtualMachineScaleSet $VMSS
        
        Write-Log "Updated VMSS model: $($VMSS.Name)" -Level "SUCCESS"
        
        # Update all instances to use the new image
        Write-Log "Updating all instances in VMSS: $($VMSS.Name)"
        $vmssInstances = Get-AzureRmVmssVM -ResourceGroupName $VMSS.ResourceGroupName -VMScaleSetName $VMSS.Name
        
        foreach ($instance in $vmssInstances) {
            Write-Log "Updating instance: $($instance.InstanceId)"
            Update-AzureRmVmssInstance -ResourceGroupName $VMSS.ResourceGroupName -VMScaleSetName $VMSS.Name -InstanceId $instance.InstanceId
        }
        
        Write-Log "Updated all instances in VMSS: $($VMSS.Name)" -Level "SUCCESS"
        return $true
    }
    catch {
        Write-Log "Error updating VMSS $($VMSS.Name): $($_.Exception.Message)" -Level "ERROR"
        return $false
    }
}
#endregion

#region Cleanup
function Remove-TempResources {
    param(
        [Parameter(Mandatory = $true)]
        [string]$ResourceGroupName
    )
    
    try {
        Write-Log "Cleaning up temporary resources in: $ResourceGroupName"
        Remove-AzureRmResourceGroup -Name $ResourceGroupName -Force
        Write-Log "Cleaned up temporary resource group: $ResourceGroupName" -Level "SUCCESS"
    }
    catch {
        Write-Log "Error cleaning up resource group $ResourceGroupName : $($_.Exception.Message)" -Level "WARNING"
    }
}
#endregion

#region Main Processing
function Start-VMSSPatching {
    param(
        [Parameter(Mandatory = $true)]
        $VMSS,
        
        [Parameter(Mandatory = $true)]
        [string]$SubscriptionId
    )
    
    $tempResourceGroup = $null
    $vmDetails = $null
    $newImage = $null
    
    try {
        Write-Log "Starting patching process for VMSS: $($VMSS.Name) in subscription: $SubscriptionId" -Level "SUCCESS"
        
        # Set the correct subscription context
        Select-AzureRmSubscription -SubscriptionId $SubscriptionId | Out-Null
        
        # Get image details from VMSS
        $imageDetails = Get-VMSSImageDetails -VMSS $VMSS
        if (!$imageDetails) {
            Write-Log "Failed to get image details for VMSS: $($VMSS.Name)" -Level "ERROR"
            return $false
        }
        
        # Create temporary resource group
        $tempResourceGroup = New-TempResourceGroup -Location $VMSS.Location -VMSSName $VMSS.Name
        if (!$tempResourceGroup) {
            Write-Log "Failed to create temporary resource group for VMSS: $($VMSS.Name)" -Level "ERROR"
            return $false
        }
        
        # Get VMSS VM size
        $vmSize = $VMSS.VirtualMachineProfile.HardwareProfile.VmSize
        Write-Log "VMSS VM Size: $vmSize"
        
        if ([string]::IsNullOrEmpty($vmSize)) {
            Write-Log "VM size is null or empty, checking alternative paths..." -Level "WARNING"
            # Try alternative property paths
            if ($VMSS.Sku -and $VMSS.Sku.Name) {
                $vmSize = $VMSS.Sku.Name
                Write-Log "Found VM size in Sku.Name: $vmSize"
            }
            elseif ($VMSS.Properties -and $VMSS.Properties.VirtualMachineProfile -and $VMSS.Properties.VirtualMachineProfile.HardwareProfile) {
                $vmSize = $VMSS.Properties.VirtualMachineProfile.HardwareProfile.VmSize
                Write-Log "Found VM size in Properties path: $vmSize"
            }
            else {
                Write-Log "Could not determine VM size, using Standard_B2s as default" -Level "WARNING"
                $vmSize = "Standard_B2s"
            }
        }
        
        # Create temporary VM
        $vmDetails = New-TempVM -ResourceGroupName $tempResourceGroup -Location $VMSS.Location `
            -ImageDetails $imageDetails -VMSSName $VMSS.Name -VMSSSize $vmSize
        if (!$vmDetails) {
            Write-Log "Failed to create temporary VM for VMSS: $($VMSS.Name)" -Level "ERROR"
            return $false
        }
        
        # Wait for VM to be ready
        Write-Log "Waiting for VM to be ready..."
        Start-Sleep -Seconds 180
        
        # Install updates on the VM
        $updateSuccess = Install-VMUpdates -VMDetails $vmDetails
        if (!$updateSuccess) {
            Write-Log "Failed to install updates on VM for VMSS: $($VMSS.Name)" -Level "ERROR"
            return $false
        }
        
        # Create new image from the updated VM
        $newImage = New-VMImage -VMDetails $vmDetails -VMSSName $VMSS.Name
        if (!$newImage) {
            Write-Log "Failed to create image from VM for VMSS: $($VMSS.Name)" -Level "ERROR"
            return $false
        }
        
        # Update VMSS to use the new image
        $updateSuccess = Update-VMSSImage -VMSS $VMSS -NewImage $newImage
        if (!$updateSuccess) {
            Write-Log "Failed to update VMSS: $($VMSS.Name)" -Level "ERROR"
            return $false
        }
        
        Write-Log "Successfully completed patching process for VMSS: $($VMSS.Name)" -Level "SUCCESS"
        return $true
    }
    catch {
        Write-Log "Error in patching process for VMSS $($VMSS.Name): $($_.Exception.Message)" -Level "ERROR"
        return $false
    }
    finally {
        # Clean up temporary resources
        if ($tempResourceGroup) {
            Remove-TempResources -ResourceGroupName $tempResourceGroup
        }
    }
}
#endregion

#region Main Script
function Main {
    Write-Log "Starting VMSS Patching Automation Script" -Level "SUCCESS"
    Write-Log "Tag Filter: $TagName = $TagValue"
    
    # Connect to Azure
    if (!(Connect-ToAzure -UseDeviceCode:$UseDeviceCode)) {
        Write-Log "Failed to connect to Azure. Exiting." -Level "ERROR"
        exit 1
    }
    
    # Get all subscriptions
    $subscriptions = Get-AllSubscriptions
    if (!$subscriptions) {
        Write-Log "No subscriptions found. Exiting." -Level "ERROR"
        exit 1
    }
    
    $totalVMSS = 0
    $successfulVMSS = 0
    $failedVMSS = 0
    
    # Process each subscription
    foreach ($subscription in $subscriptions) {
        Write-Log "Processing subscription: $($subscription.Name) ($($subscription.Id))" -Level "SUCCESS"
        
        # Get VMSS with specified tag
        $vmssList = Get-VMSSWithTag -SubscriptionId $subscription.Id -TagName $TagName -TagValue $TagValue
        
        if ($vmssList.Count -eq 0) {
            Write-Log "No VMSS found with tag '$TagName=$TagValue' in subscription: $($subscription.Name)"
            continue
        }
        
        $totalVMSS += $vmssList.Count
        
        # Process each VMSS
        foreach ($vmss in $vmssList) {
            Write-Log "Processing VMSS: $($vmss.Name) in Resource Group: $($vmss.ResourceGroupName)" -Level "SUCCESS"
            
            $success = Start-VMSSPatching -VMSS $vmss -SubscriptionId $subscription.Id
            
            if ($success) {
                $successfulVMSS++
                Write-Log "Successfully patched VMSS: $($vmss.Name)" -Level "SUCCESS"
            }
            else {
                $failedVMSS++
                Write-Log "Failed to patch VMSS: $($vmss.Name)" -Level "ERROR"
            }
        }
    }
    
    # Summary
    Write-Log "=== PATCHING SUMMARY ===" -Level "SUCCESS"
    Write-Log "Total VMSS found: $totalVMSS"
    Write-Log "Successfully patched: $successfulVMSS" -Level "SUCCESS"
    Write-Log "Failed to patch: $failedVMSS" -Level $(if ($failedVMSS -gt 0) { "ERROR" } else { "INFO" })
    Write-Log "Log file: $LogFile"
    Write-Log "VMSS Patching Automation Script completed" -Level "SUCCESS"
}

# Execute main function
Main
#endregion