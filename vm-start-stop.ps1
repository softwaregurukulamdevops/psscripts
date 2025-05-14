# Connect to Azure (if not already connected)

# Parameters
$tagName = "autostart"    # Specify your tag name
$tagValue = "enabled"     # Specify your tag value

# Function to process VMs
function Process-VMs {
    param (
        [string]$SubscriptionId,
        [string]$SubscriptionName
    )
    
    Write-Host "`nProcessing Subscription: $SubscriptionName ($SubscriptionId)" -ForegroundColor Yellow
    
    # Get all VMs with the specified tag
    $vms = Get-AzVM | Where-Object {$_.Tags.Keys -contains $tagName -and $_.Tags[$tagName] -eq $tagValue}
    
    foreach ($vm in $vms) {
        Write-Host "`nProcessing VM: $($vm.Name)" -ForegroundColor Cyan
        
        # Get the current status of the VM
        $status = (Get-AzVM -ResourceGroupName $vm.ResourceGroupName -Name $vm.Name -Status).Statuses | 
                  Where-Object { $_.Code -match "PowerState" }
        
        $powerState = $status.DisplayStatus
        Write-Host "Current Power State: $powerState"
        
        try {
            # If VM is running, stop it. If stopped, start it.
            if ($powerState -eq "VM running") {
                Write-Host "Stopping VM: $($vm.Name)" -ForegroundColor Yellow
                Stop-AzVM -ResourceGroupName $vm.ResourceGroupName -Name $vm.Name -Force
                Write-Host "VM stopped successfully" -ForegroundColor Green
            }
            elseif ($powerState -eq "VM deallocated") {
                Write-Host "Starting VM: $($vm.Name)" -ForegroundColor Yellow
                Start-AzVM -ResourceGroupName $vm.ResourceGroupName -Name $vm.Name
                Write-Host "VM started successfully" -ForegroundColor Green
            }
            else {
                Write-Host "VM is in transition state ($powerState). Skipping..." -ForegroundColor Red
            }
        }
        catch {
            Write-Host "Error processing VM $($vm.Name): $_" -ForegroundColor Red
        }
    }
}

# Main script
try {
    # Get all subscriptions
    $subscriptions = Get-AzSubscription
    
    foreach ($sub in $subscriptions) {
        # Set context to the current subscription
        Set-AzContext -SubscriptionId $sub.Id | Out-Null
        
        # Process VMs in the current subscription
        Process-VMs -SubscriptionId $sub.Id -SubscriptionName $sub.Name
    }
}
catch {
    Write-Host "Error: $_" -ForegroundColor Red
}
finally {
    Write-Host "`nScript execution completed" -ForegroundColor Green
}
