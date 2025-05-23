
param (
    # [Parameter(Mandatory = $true)]
    # [ValidateSet("Start", "Stop")]
    # [string]$Action,

    [Parameter(Mandatory = $true)]
    [string]$TagName,

    [Parameter(Mandatory = $true)]
    [string]$TagValue
)



# Connect to Azure (if not already connected)
# Authenticate with Managed Identity
Disable-AzContextAutosave -Scope Process
Connect-AzAccount -Identity

# Parameters
# $tagName = "patch"    # Specify your tag name
# $tagValue = "patch-001"     # Specify your tag value
$maxConcurrentJobs = 10    # Maximum number of concurrent jobs

# Function to process VMs in a subscription
function Process-VMs {
param (
    [string]$SubscriptionId,
    [string]$SubscriptionName
)

Write-Host "`nProcessing Subscription: $SubscriptionName ($SubscriptionId)" -ForegroundColor Yellow

# Get all VMs with the specified tag
$vms = Get-AzVM | Where-Object {$_.Tags.Keys -contains $tagName -and $_.Tags[$tagName] -eq $tagValue}

if ($vms.Count -eq 0) {
    Write-Host "No VMs found with tag $tagName = $tagValue in subscription $SubscriptionName" -ForegroundColor Yellow
    return
}

$jobs = @()

foreach ($vm in $vms) {
    # Wait if we've reached the maximum number of concurrent jobs
    while ((Get-Job -State Running).Count -ge $maxConcurrentJobs) {
        Start-Sleep -Seconds 1
        $completedJobs = Get-Job -State Completed
        foreach ($job in $completedJobs) {
            Receive-Job -Job $job
            Remove-Job -Job $job
        }
    }
    
    # Start a new job for this VM
    $jobs += Start-Job -ScriptBlock {
        param($VM, $SubscriptionId)
        Import-Module Az.Accounts
        Import-Module Az.Compute
        Disable-AzContextAutosave -Scope Process
        Connect-AzAccount -Identity
        # Set subscription context
        Set-AzContext -SubscriptionId $SubscriptionId | Out-Null

        # Get the current status of the VM
        $status = (Get-AzVM -ResourceGroupName $VM.ResourceGroupName -Name $VM.Name -Status).Statuses | 
                  Where-Object { $_.Code -match "PowerState" }
        $powerState = $status.DisplayStatus
        Write-Output "VM: $($VM.Name) - Current Power State: $powerState"

        try {
            if ($powerState -eq "VM running") {
                Write-Output "Stopping VM: $($VM.Name)"
                Stop-AzVM -ResourceGroupName $VM.ResourceGroupName -Name $VM.Name -Force
                Write-Output "VM $($VM.Name) stopped successfully"
            }
            elseif ($powerState -eq "VM deallocated") {
                Write-Output "Starting VM: $($VM.Name)"
                Start-AzVM -ResourceGroupName $VM.ResourceGroupName -Name $VM.Name
                Write-Output "VM $($VM.Name) started successfully"
            }
            else {
                Write-Output "VM $($VM.Name) is in transition state ($powerState). Skipping..."
            }
        }
        catch {
            Write-Output "Error processing VM $($VM.Name): $_"
        }
    } -ArgumentList $vm, $SubscriptionId
}

# Wait for remaining jobs to complete and process their output
Write-Host "Waiting for remaining jobs to complete..." -ForegroundColor Yellow
Wait-Job -Job $jobs | Out-Null

foreach ($job in $jobs) {
    Receive-Job -Job $job
    Remove-Job -Job $job
}
}

# Main script
try {
$subscriptions = Get-AzSubscription

foreach ($sub in $subscriptions) {
    Set-AzContext -SubscriptionId $sub.Id | Out-Null
    Process-VMs -SubscriptionId $sub.Id -SubscriptionName $sub.Name
}
}
catch {
Write-Host "Error: $_" -ForegroundColor Red
}
finally {
Get-Job | Remove-Job -Force
Write-Host "`nScript execution completed" -ForegroundColor Green
}
