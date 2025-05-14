<#
.SYNOPSIS
    Parallel VM Start/Stop based on tags across all accessible subscriptions.
.DESCRIPTION
    Azure Automation Runbook to start or stop VMs in parallel based on their current state.
    Uses tags to identify VMs to process.
.PARAMETER TagName
    The name of the tag to filter VMs
.PARAMETER TagValue
    The value of the tag to filter VMs
.PARAMETER MaxConcurrentJobs
    Maximum number of concurrent jobs to run
#>

param(
    [Parameter(Mandatory = $false)]
    [string] $TagName = "patch",

    [Parameter(Mandatory = $false)]
    [string] $TagValue = "patch-001",

    [Parameter(Mandatory = $false)]
    [int] $MaxConcurrentJobs = 10
)

# Ensure we stop on any errors
$ErrorActionPreference = 'Stop'

try {
    # Connect using Managed Identity
    Disable-AzContextAutosave -Scope Process
    Connect-AzAccount -Identity

    # Import required modules
    Import-Module Az.Compute
    Import-Module ThreadJob

    Write-Output "Starting VM management script with Tag '$TagName = $TagValue'"

    # Function to process VMs in a subscription
    function Process-VMs {
        param (
            [string]$SubscriptionId,
            [string]$SubscriptionName
        )
        
        Write-Output "Processing Subscription: $SubscriptionName ($SubscriptionId)"
        
        # Get all VMs with the specified tag
        $vms = Get-AzVM | Where-Object {$_.Tags.Keys -contains $TagName -and $_.Tags[$TagName] -eq $TagValue}
        
        if ($vms.Count -eq 0) {
            Write-Output "No VMs found with tag $TagName = $TagValue in subscription $SubscriptionName"
            return
        }

        Write-Output "Found $($vms.Count) VMs to process in subscription $SubscriptionName"
        $jobs = @()
        
        foreach ($vm in $vms) {
            # Wait if we've reached the maximum number of concurrent jobs
            while ((Get-Job -State Running).Count -ge $MaxConcurrentJobs) {
                Start-Sleep -Seconds 5
                $completedJobs = Get-Job -State Completed
                foreach ($job in $completedJobs) {
                    Receive-Job -Job $job
                    Remove-Job -Job $job
                }
            }
            
            # Start a new thread job for this VM
            $jobs += Start-ThreadJob -ScriptBlock {
                param($VM, $SubscriptionId, $ResourceGroup, $VMName)
                
                # Set subscription context
                Set-AzContext -SubscriptionId $SubscriptionId | Out-Null

                try {
                    # Get the current status of the VM
                    $status = (Get-AzVM -ResourceGroupName $ResourceGroup -Name $VMName -Status).Statuses | 
                              Where-Object { $_.Code -match "PowerState" }
                    
                    $powerState = $status.DisplayStatus
                    Write-Output "VM: $VMName - Current Power State: $powerState"

                    if ($powerState -eq "VM running") {
                        Write-Output "Stopping VM: $VMName"
                        $result = Stop-AzVM -ResourceGroupName $ResourceGroup -Name $VMName -Force
                        if ($result.Status -eq "Succeeded") {
                            Write-Output "VM $VMName stopped successfully"
                        } else {
                            Write-Error "Failed to stop VM $VMName"
                        }
                    }
                    elseif ($powerState -eq "VM deallocated") {
                        Write-Output "Starting VM: $VMName"
                        $result = Start-AzVM -ResourceGroupName $ResourceGroup -Name $VMName
                        if ($result.Status -eq "Succeeded") {
                            Write-Output "VM $VMName started successfully"
                        } else {
                            Write-Error "Failed to start VM $VMName"
                        }
                    }
                    else {
                        Write-Output "VM $VMName is in transition state ($powerState). Skipping..."
                    }
                }
                catch {
                    Write-Error "Error processing VM $VMName: $_"
                }
            } -ArgumentList $vm, $SubscriptionId, $vm.ResourceGroupName, $vm.Name
        }
        
        # Wait for remaining jobs to complete and process their output
        Write-Output "Waiting for remaining jobs in subscription $SubscriptionName to complete..."
        Wait-Job -Job $jobs | Out-Null
        
        foreach ($job in $jobs) {
            Receive-Job -Job $job
            Remove-Job -Job $job
        }
    }

    # Main processing
    $subscriptions = Get-AzSubscription
    
    foreach ($sub in $subscriptions) {
        Write-Output "Setting context to subscription: $($sub.Name)"
        Set-AzContext -SubscriptionId $sub.Id | Out-Null
        Process-VMs -SubscriptionId $sub.Id -SubscriptionName $sub.Name
    }
}
catch {
    Write-Error "Error in main script: $_"
    throw $_
}
finally {
    # Cleanup any remaining jobs
    Get-Job | Remove-Job -Force
    Write-Output "Script execution completed"
}
