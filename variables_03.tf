# Azure Subscription and General Variables
variable "subscription_id" {
  description = "The subscription ID for Azure resources"
  type        = string
  default     = "6088f278-2d38-4bdd-9e08-e5417d44af11"
}

variable "tenant_id" {
  description = "The tenant ID for Azure DevOps"
  type        = string
  default     = "51150d51-ffd8-4b46-ad9a-12038c211b72"
}

# Resource Group Variables
variable "resource_group_name" {
  description = "Primary resource group name"
  type        = string
  default     = "M-CSSPZ-RG-MAN-PRD-003"
}

variable "resource_group_name_des" {
  description = "Resource group name for disk encryption sets"
  type        = string
  default     = "M-CSSPZ-RG-MAN-PRD-004"
}

variable "resource_group_name_vnet" {
  description = "Resource group name for virtual network"
  type        = string
  default     = "M-CSSPZ-RG-MAN-PRD-001"
}

variable "resource_group_name_identity" {
  description = "Resource group name for managed identities"
  type        = string
  default     = "R-CSSPZ-RG-MAN-SC-PRD-001"
}

variable "resource_group_name_soc" {
  description = "Resource group name for SOC"
  type        = string
  default     = "m-csspz-rg-soc-prd-001"
}

# Location Variable
variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "northeurope"
}

# Environment Tag
variable "environment" {
  description = "Environment designation"
  type        = string
  default     = "PRD"
}

# User Assigned Identity Variables
variable "managed_identity_name" {
  description = "Name of the user assigned managed identity"
  type        = string
  default     = "R-CSSPZ-MI-MAN-PRD-001"
}

variable "managed_identity_identity_only_name" {
  description = "Name of the identity only managed identity"
  type        = string
  default     = "R-CSSPZ-MI-MAN-POL-SC-PRD-001"
}

# Network Variables
variable "network_interface_names" {
  description = "Names of network interfaces"
  type        = map(string)
  default = {
    ovoc_image = "m-csspz-ovoc-image212_z1"
    cyberark   = "m-csspz-vm-cyberark-man-prd-001315_z1"
    snowsync   = "m-csspz-vm-snowsync-man-prd-001425_z1"
  }
}

variable "vnet_name" {
  description = "Virtual network name"
  type        = string
  default     = "M-CSSPZ-VNET-MAN-PRD-001"
}

variable "subnet_names" {
  description = "Subnet names"
  type        = map(string)
  default = {
    fgt_subnet      = "M-CSSPZ-SNET-FGT-PRD-001"
    man_subnet      = "M-CSSPZ-SNET-MAN-PRD-001"
    cyberark_subnet = "R-CSSPZ-SNET-MAN-PRD-005"
  }
}

# Network Security Group Variables
variable "nsg_names" {
  description = "Network security group names"
  type        = map(string)
  default = {
    ovoc_image          = "M-CSSPZ-OVOC-IMAGE-nsg"
    cyberark_001        = "M-CSSPZ-VM-CYBERARK-MAN-PRD-001-nsg"
    cyberark_002        = "M-CSSPZ-VM-CYBERARK-MAN-PRD-002-nsg"
    snowsync            = "M-CSSPZ-VM-SNOWSYNC-MAN-PRD-001-nsg"
    cyberark_backup_001 = "MCSSPZVMCYBERARKMANPRD001nsg105"
    cyberark_backup_002 = "MCSSPZVMCYBERARKMANPRD001nsg430"
    cyberark_backup_003 = "MCSSPZVMCYBERARKMANPRD001nsg497"
  }
}

# Disk Encryption Set Variables
variable "disk_encryption_set_name" {
  description = "Disk encryption set name"
  type        = string
  default     = "M-DES-MAN-PROD-001"
}

# Public IP Variables
variable "public_ip_name" {
  description = "Public IP address name"
  type        = string
  default     = "M-CSSPZ-VM-SNOWSYNC-MAN-PRD-001-ip"
}

variable "public_ip_sku" {
  description = "Public IP SKU"
  type        = string
  default     = "Standard"
}

# Recovery Services Vault Variables
variable "recovery_vault_name" {
  description = "Recovery Services Vault name"
  type        = string
  default     = "R-CSSPZ-RV-MAN-PRD-001"
}

variable "recovery_vault_sku" {
  description = "Recovery Services Vault SKU"
  type        = string
  default     = "Standard"
}

# Backup Policy Names
variable "backup_policy_default_name" {
  description = "Default backup policy name"
  type        = string
  default     = "DefaultPolicy"
}

variable "backup_policy_enhanced_name" {
  description = "Enhanced backup policy name"
  type        = string
  default     = "EnhancedPolicy"
}

variable "backup_daily_retention_count" {
  description = "Daily retention count for backups"
  type        = number
  default     = 30
}

variable "backup_daily_retention_count_vm" {
  description = "Daily retention count for VM backups"
  type        = number
  default     = 35
}

# Automation Account Variables
variable "automation_account_name" {
  description = "Automation account name"
  type        = string
  default     = "R-CSSPZ-AA-MAN-PRD-001"
}

variable "automation_account_sku" {
  description = "Automation account SKU"
  type        = string
  default     = "Basic"
}

variable "automation_module_uris" {
  description = "Map of automation module names to their download URIs (PowerShell Gallery URLs). Update with correct module versions."
  type        = map(string)
  default = {
    "AuditPolicyDsc"                       = "https://www.powershellgallery.com/api/v2/package/AuditPolicyDsc/1.4.0"
    "Az"                                   = "https://www.powershellgallery.com/api/v2/package/Az/10.0.0"
    "Az.Accounts"                          = "https://www.powershellgallery.com/api/v2/package/Az.Accounts/2.12.1"
    "Az.Advisor"                           = "https://www.powershellgallery.com/api/v2/package/Az.Advisor/2.0.0"
    "Az.Aks"                               = "https://www.powershellgallery.com/api/v2/package/Az.Aks/5.5.0"
    "Az.AnalysisServices"                  = "https://www.powershellgallery.com/api/v2/package/Az.AnalysisServices/1.1.4"
    "Az.ApiManagement"                     = "https://www.powershellgallery.com/api/v2/package/Az.ApiManagement/4.0.2"
    "Az.AppConfiguration"                  = "https://www.powershellgallery.com/api/v2/package/Az.AppConfiguration/1.3.0"
    "Az.ApplicationInsights"               = "https://www.powershellgallery.com/api/v2/package/Az.ApplicationInsights/2.2.0"
    "Az.Attestation"                       = "https://www.powershellgallery.com/api/v2/package/Az.Attestation/2.0.0"
    "Az.Automation"                        = "https://www.powershellgallery.com/api/v2/package/Az.Automation/1.9.0"
    "Az.Batch"                             = "https://www.powershellgallery.com/api/v2/package/Az.Batch/3.5.0"
    "Az.Billing"                           = "https://www.powershellgallery.com/api/v2/package/Az.Billing/2.0.3"
    "Az.Cdn"                               = "https://www.powershellgallery.com/api/v2/package/Az.Cdn/2.1.0"
    "Az.CloudService"                      = "https://www.powershellgallery.com/api/v2/package/Az.CloudService/1.2.0"
    "Az.CognitiveServices"                 = "https://www.powershellgallery.com/api/v2/package/Az.CognitiveServices/1.14.0"
    "Az.Compute"                           = "https://www.powershellgallery.com/api/v2/package/Az.Compute/5.7.0"
    "Az.ContainerInstance"                 = "https://www.powershellgallery.com/api/v2/package/Az.ContainerInstance/3.2.1"
    "Az.ContainerRegistry"                 = "https://www.powershellgallery.com/api/v2/package/Az.ContainerRegistry/4.1.1"
    "Az.CosmosDB"                          = "https://www.powershellgallery.com/api/v2/package/Az.CosmosDB/1.12.0"
    "Az.DataBoxEdge"                       = "https://www.powershellgallery.com/api/v2/package/Az.DataBoxEdge/1.1.0"
    "Az.DataFactory"                       = "https://www.powershellgallery.com/api/v2/package/Az.DataFactory/1.16.13"
    "Az.DataLakeAnalytics"                 = "https://www.powershellgallery.com/api/v2/package/Az.DataLakeAnalytics/1.0.2"
    "Az.DataLakeStore"                     = "https://www.powershellgallery.com/api/v2/package/Az.DataLakeStore/1.3.0"
    "Az.DataShare"                         = "https://www.powershellgallery.com/api/v2/package/Az.DataShare/1.0.1"
    "Az.Databricks"                        = "https://www.powershellgallery.com/api/v2/package/Az.Databricks/1.5.0"
    "Az.DeploymentManager"                 = "https://www.powershellgallery.com/api/v2/package/Az.DeploymentManager/1.1.0"
    "Az.DesktopVirtualization"             = "https://www.powershellgallery.com/api/v2/package/Az.DesktopVirtualization/4.2.0"
    "Az.DevTestLabs"                       = "https://www.powershellgallery.com/api/v2/package/Az.DevTestLabs/1.0.2"
    "Az.Dns"                               = "https://www.powershellgallery.com/api/v2/package/Az.Dns/1.1.2"
    "Az.EventGrid"                         = "https://www.powershellgallery.com/api/v2/package/Az.EventGrid/1.6.0"
    "Az.EventHub"                          = "https://www.powershellgallery.com/api/v2/package/Az.EventHub/3.2.1"
    "Az.FrontDoor"                         = "https://www.powershellgallery.com/api/v2/package/Az.FrontDoor/1.10.0"
    "Az.Functions"                         = "https://www.powershellgallery.com/api/v2/package/Az.Functions/4.0.7"
    "Az.HDInsight"                         = "https://www.powershellgallery.com/api/v2/package/Az.HDInsight/6.0.1"
    "Az.HealthcareApis"                    = "https://www.powershellgallery.com/api/v2/package/Az.HealthcareApis/2.0.0"
    "Az.IotHub"                            = "https://www.powershellgallery.com/api/v2/package/Az.IotHub/2.7.5"
    "Az.KeyVault"                          = "https://www.powershellgallery.com/api/v2/package/Az.KeyVault/4.9.2"
    "Az.Kusto"                             = "https://www.powershellgallery.com/api/v2/package/Az.Kusto/2.3.0"
    "Az.LogicApp"                          = "https://www.powershellgallery.com/api/v2/package/Az.LogicApp/1.5.0"
    "Az.MachineLearning"                   = "https://www.powershellgallery.com/api/v2/package/Az.MachineLearning/1.1.3"
    "Az.Maintenance"                       = "https://www.powershellgallery.com/api/v2/package/Az.Maintenance/1.3.1"
    "Az.ManagedServiceIdentity"            = "https://www.powershellgallery.com/api/v2/package/Az.ManagedServiceIdentity/1.2.0"
    "Az.ManagedServices"                   = "https://www.powershellgallery.com/api/v2/package/Az.ManagedServices/3.0.0"
    "Az.MarketplaceOrdering"               = "https://www.powershellgallery.com/api/v2/package/Az.MarketplaceOrdering/2.0.0"
    "Az.Media"                             = "https://www.powershellgallery.com/api/v2/package/Az.Media/1.1.1"
    "Az.Migrate"                           = "https://www.powershellgallery.com/api/v2/package/Az.Migrate/2.2.0"
    "Az.Monitor"                           = "https://www.powershellgallery.com/api/v2/package/Az.Monitor/4.4.0"
    "Az.MySql"                             = "https://www.powershellgallery.com/api/v2/package/Az.MySql/1.1.1"
    "Az.Network"                           = "https://www.powershellgallery.com/api/v2/package/Az.Network/5.8.0"
    "Az.NotificationHubs"                  = "https://www.powershellgallery.com/api/v2/package/Az.NotificationHubs/1.1.1"
    "Az.OperationalInsights"               = "https://www.powershellgallery.com/api/v2/package/Az.OperationalInsights/3.2.0"
    "Az.PolicyInsights"                    = "https://www.powershellgallery.com/api/v2/package/Az.PolicyInsights/1.6.1"
    "Az.PostgreSql"                        = "https://www.powershellgallery.com/api/v2/package/Az.PostgreSql/1.1.1"
    "Az.PowerBIEmbedded"                   = "https://www.powershellgallery.com/api/v2/package/Az.PowerBIEmbedded/1.2.0"
    "Az.PrivateDns"                        = "https://www.powershellgallery.com/api/v2/package/Az.PrivateDns/1.0.4"
    "Az.RecoveryServices"                  = "https://www.powershellgallery.com/api/v2/package/Az.RecoveryServices/6.4.0"
    "Az.RedisCache"                        = "https://www.powershellgallery.com/api/v2/package/Az.RedisCache/1.7.1"
    "Az.RedisEnterpriseCache"              = "https://www.powershellgallery.com/api/v2/package/Az.RedisEnterpriseCache/1.2.0"
    "Az.Relay"                             = "https://www.powershellgallery.com/api/v2/package/Az.Relay/2.0.0"
    "Az.ResourceMover"                     = "https://www.powershellgallery.com/api/v2/package/Az.ResourceMover/1.2.0"
    "Az.Resources"                         = "https://www.powershellgallery.com/api/v2/package/Az.Resources/6.6.0"
    "Az.Security"                          = "https://www.powershellgallery.com/api/v2/package/Az.Security/1.5.0"
    "Az.SecurityInsights"                  = "https://www.powershellgallery.com/api/v2/package/Az.SecurityInsights/3.0.1"
    "Az.ServiceBus"                        = "https://www.powershellgallery.com/api/v2/package/Az.ServiceBus/3.0.0"
    "Az.ServiceFabric"                     = "https://www.powershellgallery.com/api/v2/package/Az.ServiceFabric/3.3.1"
    "Az.SignalR"                           = "https://www.powershellgallery.com/api/v2/package/Az.SignalR/1.5.0"
    "Az.Sql"                               = "https://www.powershellgallery.com/api/v2/package/Az.Sql/4.4.0"
    "Az.SqlVirtualMachine"                 = "https://www.powershellgallery.com/api/v2/package/Az.SqlVirtualMachine/2.1.0"
    "Az.StackHCI"                          = "https://www.powershellgallery.com/api/v2/package/Az.StackHCI/2.2.0"
    "Az.Storage"                           = "https://www.powershellgallery.com/api/v2/package/Az.Storage/5.5.0"
    "Az.StorageSync"                       = "https://www.powershellgallery.com/api/v2/package/Az.StorageSync/2.0.1"
    "Az.StreamAnalytics"                   = "https://www.powershellgallery.com/api/v2/package/Az.StreamAnalytics/2.0.0"
    "Az.Support"                           = "https://www.powershellgallery.com/api/v2/package/Az.Support/1.0.0"
    "Az.Synapse"                           = "https://www.powershellgallery.com/api/v2/package/Az.Synapse/3.0.2"
    "Az.TrafficManager"                    = "https://www.powershellgallery.com/api/v2/package/Az.TrafficManager/1.2.0"
    "Az.Websites"                          = "https://www.powershellgallery.com/api/v2/package/Az.Websites/3.1.1"
    "Azure"                                = "https://www.powershellgallery.com/api/v2/package/Azure/5.3.1"
    "Azure.Storage"                        = "https://www.powershellgallery.com/api/v2/package/Azure.Storage/4.6.1"
    "AzureRM.Automation"                   = "https://www.powershellgallery.com/api/v2/package/AzureRM.Automation/6.1.2"
    "AzureRM.Compute"                      = "https://www.powershellgallery.com/api/v2/package/AzureRM.Compute/5.9.1"
    "AzureRM.Profile"                      = "https://www.powershellgallery.com/api/v2/package/AzureRM.Profile/5.8.4"
    "AzureRM.Resources"                    = "https://www.powershellgallery.com/api/v2/package/AzureRM.Resources/6.7.4"
    "AzureRM.Sql"                          = "https://www.powershellgallery.com/api/v2/package/AzureRM.Sql/4.12.2"
    "AzureRM.Storage"                      = "https://www.powershellgallery.com/api/v2/package/AzureRM.Storage/5.2.1"
    "ComputerManagementDsc"                = "https://www.powershellgallery.com/api/v2/package/ComputerManagementDsc/9.0.0"
    "GPRegistryPolicyParser"               = "https://www.powershellgallery.com/api/v2/package/GPRegistryPolicyParser/1.0.0"
    "Microsoft.PowerShell.Core"            = "https://www.powershellgallery.com/api/v2/package/Microsoft.PowerShell.Core/7.3.0"
    "Microsoft.PowerShell.Diagnostics"     = "https://www.powershellgallery.com/api/v2/package/Microsoft.PowerShell.Diagnostics/7.3.0"
    "Microsoft.PowerShell.Management"      = "https://www.powershellgallery.com/api/v2/package/Microsoft.PowerShell.Management/7.3.0"
    "Microsoft.PowerShell.Security"        = "https://www.powershellgallery.com/api/v2/package/Microsoft.PowerShell.Security/7.3.0"
    "Microsoft.PowerShell.Utility"         = "https://www.powershellgallery.com/api/v2/package/Microsoft.PowerShell.Utility/7.3.0"
    "Microsoft.WSMan.Management"           = "https://www.powershellgallery.com/api/v2/package/Microsoft.WSMan.Management/7.3.0"
    "Orchestrator.AssetManagement.Cmdlets" = "https://www.powershellgallery.com/api/v2/package/Orchestrator.AssetManagement.Cmdlets/1.0.0"
    "PSDscResources"                       = "https://www.powershellgallery.com/api/v2/package/PSDscResources/2.12.0"
    "SecurityPolicyDsc"                    = "https://www.powershellgallery.com/api/v2/package/SecurityPolicyDsc/2.10.0"
    "StateConfigCompositeResources"        = "https://www.powershellgallery.com/api/v2/package/StateConfigCompositeResources/1.0.0"
    "xDSCDomainjoin"                       = "https://www.powershellgallery.com/api/v2/package/xDSCDomainjoin/1.2.0"
    "xPowerShellExecutionPolicy"           = "https://www.powershellgallery.com/api/v2/package/xPowerShellExecutionPolicy/3.1.0"
    "xRemoteDesktopAdmin"                  = "https://www.powershellgallery.com/api/v2/package/xRemoteDesktopAdmin/1.1.0"
  }
}

# Virtual Machine Variables
variable "vm_cyberark_name" {
  description = "CyberArk VM name"
  type        = string
  default     = "M-CSSPZ-VM-CYBERARK-MAN-PRD-001"
}

variable "vm_cyberark_size" {
  description = "CyberArk VM size"
  type        = string
  default     = "Standard_D4s_v3"
}

variable "vm_cyberark_admin_username" {
  description = "CyberArk VM admin username"
  type        = string
  default     = "cyberarkadmin"
  sensitive   = true
}

variable "vm_cyberark_admin_password" {
  description = "CyberArk VM admin password"
  type        = string
  sensitive   = true
}

variable "os_type" {
  description = "Operating system type"
  type        = string
  default     = "Windows"
}

# Disk Variables
variable "managed_disk_name" {
  description = "Managed disk name"
  type        = string
  default     = "M-CSSPZ-OVOC-IMAGE_OsDisk_1_23e74f38e4c04fccaa56f89b7780dd34"
}

variable "managed_disk_storage_account_type" {
  description = "Managed disk storage account type"
  type        = string
  default     = "Premium_LRS"
}

# VM Image Variables
variable "vm_image_offer" {
  description = "VM image offer"
  type        = string
  default     = "WindowsServer"
}

variable "vm_image_publisher" {
  description = "VM image publisher"
  type        = string
  default     = "MicrosoftWindowsServer"
}

variable "vm_image_sku" {
  description = "VM image SKU"
  type        = string
  default     = "2022-datacenter-azure-edition"
}

variable "vm_image_version" {
  description = "VM image version"
  type        = string
  default     = "latest"
}

# Azure DevOps OIDC Variables
variable "devops_issuer_url" {
  description = "Azure DevOps OIDC issuer URL"
  type        = string
  default     = "https://vstoken.dev.azure.com/51150d51-ffd8-4b46-ad9a-12038c211b72"
}

variable "devops_subject" {
  description = "Azure DevOps OIDC subject"
  type        = string
  default     = "sc://BOIGroup-CCoE-CSSPZ/CSSPZ-LandingZone/R-CSSPZ-MI-MAN-POOL-SC-PRD-001"
}

# Tags Variables
variable "common_tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default = {
    "Account Type"            = "PLACEHOLDER"
    "App Support"             = "PLACEHOLDER"
    AppSupport                = "PLACEHOLDER"
    "BOI Application"         = "PLACEHOLDER"
    "BOI Application Service" = "PLACEHOLDER"
    Backup                    = "PLACEHOLDER"
    "Business Function"       = "PLACEHOLDER"
    "Business Unit"           = "PLACEHOLDER"
    BusinessUnit              = "PLACEHOLDER"
    Compliance                = "PLACEHOLDER"
    Confidentiality           = "PLACEHOLDER"
    "Cost Centre"             = "PLACEHOLDER"
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "Production"
    "Infra Support"           = "PLACEHOLDER"
    InfraSupport              = "HCL-VIP-Support"
    "Log Level"               = "PLACEHOLDER"
    "Log Zone"                = "PLACEHOLDER"
    MaintWinPatch             = "PLACEHOLDER"
    MaintWinPatchScan         = "PLACEHOLDER"
    Name                      = "PLACEHOLDER"
    "Operating System"        = "PLACEHOLDER"
    OperatingSystem           = "PLACEHOLDER"
    "Operational Status"      = "PLACEHOLDER"
    Owner                     = "Daniel Dalla"
    PII                       = "PLACEHOLDER"
    "Patch Group"             = "PLACEHOLDER"
    Project                   = "PLACEHOLDER"
    "Server Criticality"      = "PLACEHOLDER"
    ServerCriticality         = "PLACEHOLDER"
    "Support Groups"          = "PLACEHOLDER"
  }
}

# Maintenance Configuration Variables
variable "maintenance_config_names" {
  description = "Names of maintenance configurations"
  type        = list(string)
  default = [
    "Nightly-2am",
    "Nightly-3am",
    "PilotGrp1",
    "PilotGrp2",
    "PilotGrp3",
    "PrepGrp1",
    "PrepGrp2",
    "PrepGrp3",
    "ProdGrp1",
    "ProdGrp2",
    "ProdGrp3",
    "TestGrp1",
    "TestGrp2",
    "TestGrp3"
  ]
}

# Backup Policy Names
variable "backup_policy_names" {
  description = "Names of backup policies"
  type        = map(string)
  default = {
    hourly_log_backup  = "HourlyLogBackup"
    sql_backup_default = "SQL-Backup-Default"
    vm_backup_default  = "VM-Backup-Default"
    vm_backup_enhanced = "VM-Backup-EnhancedPolicy"
  }
}

# Automation Runbook Names
variable "automation_runbook_names" {
  description = "Names of automation runbooks"
  type        = map(string)
  default = {
    vm_start_stop          = "R-VM-START-STOP"
    tag_policy_remediation = "M-TagPolicy-Remediation-Runbook-PRD"
    aum_attach_vm          = "R-AUM-ATTACH-VM"
  }
}

# Automation Schedule Names and Configuration
variable "automation_schedule_names" {
  description = "Names of automation schedules"
  type        = map(string)
  default = {
    autoshutdown_patch_start        = "CSSPZ-AutoShutdown-patch-start"
    autoshutdown_patch_stop         = "CSSPZ-AutoShutdown-patch-stop"
    autoshutdown_stop               = "CSSPZ-AutoShutdown-stop"
    ie_office_hours_start           = "CSSPZ-ie-office-hours-start"
    ie_office_hours_stop            = "CSSPZ-ie-office-hours-stop"
    ie_office_hours_patch_start     = "CSSPZ-ie-office-hours-patch-start"
    ie_office_hours_patch_stop      = "CSSPZ-ie-office-hours-patch-stop"
    india_office_hours_start        = "CSSPZ-india-office-hours-start"
    india_office_hours_stop         = "CSSPZ-india-office-hours-stop"
    india_office_hours_patch_start  = "CSSPZ-india-office-hours-patch-start"
    india_office_hours_patch_stop   = "CSSPZ-india-office-hours-patch-stop"
    eu_office_hours_start           = "CSSPZ-eu-office-hours-start"
    eu_office_hours_stop            = "CSSPZ-eu-office-hours-stop"
    eu_office_hours_patch_start     = "CSSPZ-eu-office-hours-patch-start"
    eu_office_hours_patch_stop      = "CSSPZ-eu-office-hours-patch-stop"
    workload_mw_patch_nightly_12am  = "R-CSSPZ-Workload-MW-PatchNightly-12am"
    workload_mw_patch_nightly_12pm  = "R-CSSPZ-Workload-MW-PatchNightly-12pm"
    tag_policy_remediation_schedule = "m-Tagpolicy-remediation-runbook-prd-schedule"
  }
}

# Automation Schedule Times and Timezones
variable "schedule_timezone_dublin" {
  description = "Timezone for Dublin office hours and schedules"
  type        = string
  default     = "Europe/Dublin"
}

variable "schedule_timezone_gmt" {
  description = "Timezone for GMT-based schedules"
  type        = string
  default     = "GMT Standard Time"
}

# Maintenance Configuration Variables
variable "maintenance_configuration_names" {
  description = "Names of maintenance configurations"
  type        = map(string)
  default = {
    nightly_2am = "Nightly-2am"
    nightly_3am = "Nightly-3am"
    pilot_grp1  = "PilotGrp1"
    pilot_grp2  = "PilotGrp2"
    pilot_grp3  = "PilotGrp3"
    test_grp1   = "TestGrp1"
    test_grp2   = "TestGrp2"
    test_grp3   = "TestGrp3"
    prep_grp1   = "PrepGrp1"
    prep_grp2   = "PrepGrp2"
    prep_grp3   = "PrepGrp3"
    prod_grp1   = "ProdGrp1"
    prod_grp2   = "ProdGrp2"
    prod_grp3   = "ProdGrp3"
  }
}

variable "maintenance_configuration_scope" {
  description = "Scope for maintenance configurations"
  type        = string
  default     = "InGuestPatch"
}

# Maintenance Window Start Times
variable "maintenance_window_start_times" {
  description = "Start times for maintenance windows (YYYY-MM-DD HH:MM format)"
  type        = map(string)
  default = {
    nightly_2am = "2025-07-03 02:00"
    nightly_3am = "2025-07-03 03:00"
    pilot_grp1  = "2025-08-05 02:00"
    pilot_grp2  = "2025-08-05 03:00"
    pilot_grp3  = "2025-08-05 04:00"
    prep_grp1   = "2025-07-15 02:00"
    prep_grp2   = "2025-07-16 02:00"
    prep_grp3   = "2025-07-17 02:00"
    prod_grp1   = "2025-07-22 02:00"
    prod_grp2   = "2025-07-23 02:00"
    prod_grp3   = "2025-07-24 02:00"
    test_grp1   = "2025-07-08 02:00"
    test_grp2   = "2025-07-08 03:00"
    test_grp3   = "2025-07-08 04:00"
  }
}

# Maintenance Window Duration (in hours)
variable "maintenance_window_duration_hours" {
  description = "Duration of maintenance windows in hours"
  type        = number
  default     = 1
}

# Federated Identity Configuration
variable "federated_identity_name" {
  description = "Name of the federated identity credential"
  type        = string
  default     = "R-CSSPZ-MI-MAN-POOL-SC-PRD-001"
}

variable "federated_identity_audience" {
  description = "Audience for federated identity token exchange"
  type        = string
  default     = "api://AzureADTokenExchange"
}

# Backup Time Variables
variable "backup_times" {
  description = "Backup times for different backup policies"
  type        = map(string)
  default = {
    hourly_log_backup  = "08:00"
    sql_backup_default = "03:30"
    vm_backup_default  = "23:00"
    vm_backup_enhanced = "23:00"
  }
}

# IP Configuration Names
variable "ip_configuration_name" {
  description = "Name of the IP configuration for network interfaces"
  type        = string
  default     = "ipconfig1"
}

# VM Extension Configuration
variable "vm_extension_mde_name" {
  description = "Name of the Microsoft Defender for Endpoints extension"
  type        = string
  default     = "MDE.Windows"
}

variable "vm_extension_mde_publisher" {
  description = "Publisher of the Microsoft Defender for Endpoints extension"
  type        = string
  default     = "Microsoft.Azure.AzureDefenderForServers"
}

variable "vm_extension_azmonitor_name" {
  description = "Name of the Azure Monitor Windows Agent extension"
  type        = string
  default     = "AzureMonitorWindowsAgent"
}

# Activity Log Alert Variables
variable "activity_log_alert_name" {
  description = "Name of the activity log alert"
  type        = string
  default     = "Test Azure and ServiceNow sync"
}

variable "activity_log_alert_webhook_group" {
  description = "Webhook group for activity log alerts"
  type        = string
  default     = "HCL-VIP-Support"
}

variable "activity_log_alert_category" {
  description = "Category for activity log alerts"
  type        = string
  default     = "Administrative"
}

# Azure Managed Identity for Automation (Service Principal)
variable "automation_service_principal_id" {
  description = "Service Principal ID for Azure automation account authentication"
  type        = string
  default     = "a139e097-5a1c-4b9f-a6fd-347f260b3bff"
}

# Automation Management Policy Variables
variable "automation_management_group" {
  description = "Management group for automation policies"
  type        = string
  default     = "BOIProd"
}

variable "automation_policy_asg" {
  description = "Policy ASG for automation"
  type        = string
  default     = "dfc_azure_arc_policy_asg"
}

variable "automation_management_group_lowercase" {
  description = "Management group name for lowercase URLs"
  type        = string
  default     = "boiprod"
}

# NSG Rule Variables
variable "nsg_rules" {
  description = "Network security group rules"
  type = map(object({
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
  default = {
    https = {
      priority                   = 1010
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
    ssh = {
      priority                   = 1020
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}

# Action Group Variables
variable "action_group_id" {
  description = "Action group resource ID for alerts"
  type        = string
  default     = "/subscriptions/b97da650-b444-4530-9f4b-968706a96e1b/resourcegroups/m-csspz-rg-soc-prd-001/providers/microsoft.insights/actiongroups/servicenow azure monitor sync"
}

# Automation Runbook Names
variable "runbook_names" {
  description = "Runbook names"
  type        = map(string)
  default = {
    tag_policy_remediation = "M-TagPolicy-Remediation-Runbook-PRD"
    vm_start_stop          = "R-VM-START-STOP"
    aum_attach_vm          = "R-AUM-ATTACH-VM"
  }
}

variable "runbook_type" {
  description = "Runbook type"
  type        = string
  default     = "PowerShell"
}

# Maintenance Window Duration (legacy variable)
variable "maintenance_window_duration" {
  description = "Maintenance window duration"
  type        = string
  default     = "04:00"
}

# VM Zone Variables
variable "availability_zone" {
  description = "Availability zone for resources"
  type        = string
  default     = "1"
}

# Backup Configuration Variables
variable "backup_frequency_daily" {
  description = "Backup frequency - daily"
  type        = string
  default     = "Daily"
}

variable "backup_frequency_hourly" {
  description = "Backup frequency - hourly"
  type        = string
  default     = "Hourly"
}

variable "backup_time" {
  description = "Backup time"
  type        = string
  default     = "03:30"
}

variable "vm_patch_mode" {
  description = "VM patching mode"
  type        = string
  default     = "AutomaticByPlatform"
}

# Azure DevOps subscription ID for action groups
variable "secondary_subscription_id" {
  description = "Secondary subscription ID for action groups"
  type        = string
  default     = "b97da650-b444-4530-9f4b-968706a96e1b"
}

# Additional Configuration Variables
variable "hyperv_generation" {
  description = "Hyper-V generation"
  type        = string
  default     = "V1"
}

variable "secure_boot_enabled" {
  description = "Secure boot enabled"
  type        = bool
  default     = true
}

variable "vtpm_enabled" {
  description = "vTPM enabled"
  type        = bool
  default     = true
}

# Tag Overrides for Specific Resource Types
variable "tags_vm_extension" {
  description = "Tag overrides for VM extensions"
  type        = map(string)
  default     = {}
}

variable "tags_managed_identity" {
  description = "Tag overrides for managed identities"
  type        = map(string)
  default     = {}
}

variable "tags_network_interface" {
  description = "Tag overrides for network interfaces"
  type        = map(string)
  default     = {}
}

variable "tags_network_security_group" {
  description = "Tag overrides for network security groups"
  type        = map(string)
  default     = {}
}

variable "tags_public_ip" {
  description = "Tag overrides for public IPs"
  type        = map(string)
  default     = {}
}

variable "tags_recovery_vault" {
  description = "Tag overrides for recovery vaults"
  type        = map(string)
  default     = {}
}

variable "tags_backup_policy" {
  description = "Tag overrides for backup policies"
  type        = map(string)
  default     = {}
}

variable "tags_automation_account" {
  description = "Tag overrides for automation accounts"
  type        = map(string)
  default     = {}
}

variable "tags_automation_schedule" {
  description = "Tag overrides for automation schedules"
  type        = map(string)
  default     = {}
}

variable "tags_automation_runbook" {
  description = "Tag overrides for automation runbooks"
  type        = map(string)
  default     = {}
}

variable "tags_automation_module" {
  description = "Tag overrides for automation modules"
  type        = map(string)
  default     = {}
}

variable "tags_maintenance_config" {
  description = "Tag overrides for maintenance configurations"
  type        = map(string)
  default     = {}
}

variable "tags_alert" {
  description = "Tag overrides for alerts and monitoring"
  type        = map(string)
  default     = {}
}

variable "tags_managed_disk" {
  description = "Tag overrides for managed disks"
  type        = map(string)
  default     = {}
}

variable "tags_virtual_machine" {
  description = "Tag overrides for virtual machines"
  type        = map(string)
  default     = {}
}

variable "automation_module_names" {
  description = "List of PowerShell modules to import in automation account"
  type        = list(string)
  default = [
    "AuditPolicyDsc",
    "Az",
    "Az.Accounts",
    "Az.Advisor",
    "Az.Aks",
    "Az.AnalysisServices",
    "Az.ApiManagement",
    "Az.AppConfiguration",
    "Az.ApplicationInsights",
    "Az.Attestation",
    "Az.Automation",
    "Az.Batch",
    "Az.Billing",
    "Az.Cdn",
    "Az.CloudService",
    "Az.CognitiveServices",
    "Az.Compute",
    "Az.ContainerInstance",
    "Az.ContainerRegistry",
    "Az.CosmosDB",
    "Az.DataBoxEdge",
    "Az.DataFactory",
    "Az.DataLakeAnalytics",
    "Az.DataLakeStore",
    "Az.DataShare",
    "Az.Databricks",
    "Az.DeploymentManager",
    "Az.DesktopVirtualization",
    "Az.DevTestLabs",
    "Az.Dns",
    "Az.EventGrid",
    "Az.EventHub",
    "Az.FrontDoor",
    "Az.Functions",
    "Az.HDInsight",
    "Az.HealthcareApis",
    "Az.IotHub",
    "Az.KeyVault",
    "Az.Kusto",
    "Az.LogicApp",
    "Az.MachineLearning",
    "Az.Maintenance",
    "Az.ManagedServiceIdentity",
    "Az.ManagedServices",
    "Az.MarketplaceOrdering",
    "Az.Media",
    "Az.Migrate",
    "Az.Monitor",
    "Az.MySql",
    "Az.Network",
    "Az.NotificationHubs",
    "Az.OperationalInsights",
    "Az.PolicyInsights",
    "Az.PostgreSql",
    "Az.PowerBIEmbedded",
    "Az.PrivateDns",
    "Az.RecoveryServices",
    "Az.RedisCache",
    "Az.RedisEnterpriseCache",
    "Az.Relay",
    "Az.ResourceMover",
    "Az.Resources",
    "Az.Security",
    "Az.SecurityInsights",
    "Az.ServiceBus",
    "Az.ServiceFabric",
    "Az.SignalR",
    "Az.Sql",
    "Az.SqlVirtualMachine",
    "Az.StackHCI",
    "Az.Storage",
    "Az.StorageSync",
    "Az.StreamAnalytics",
    "Az.Support",
    "Az.Synapse",
    "Az.TrafficManager",
    "Az.Websites",
    "Azure",
    "Azure.Storage",
    "AzureRM.Automation",
    "AzureRM.Compute",
    "AzureRM.Profile",
    "AzureRM.Resources",
    "AzureRM.Sql",
    "AzureRM.Storage",
    "ComputerManagementDsc",
    "GPRegistryPolicyParser",
    "Microsoft.PowerShell.Core",
    "Microsoft.PowerShell.Diagnostics",
    "Microsoft.PowerShell.Management",
    "Microsoft.PowerShell.Security",
    "Microsoft.PowerShell.Utility",
    "Microsoft.WSMan.Management",
    "Orchestrator.AssetManagement.Cmdlets",
    "PSDscResources",
    "SecurityPolicyDsc",
    "StateConfigCompositeResources",
    "xDSCDomainjoin",
    "xPowerShellExecutionPolicy",
    "xRemoteDesktopAdmin"
  ]
}
# ========================================
# ADDITIONAL PARAMETRIZED VARIABLES
# ========================================

# Backup Policy Resource Groups
variable "backup_policy_resource_group_name" {
  description = "Resource group name for backup policies"
  type        = string
  default     = "M-CSSPZ-RG-MAN-PRD-003"
}

# Backup Policy Numeric Settings
variable "backup_policy_hour_duration" {
  description = "Backup policy hour duration"
  type        = number
  default     = 12
}

variable "backup_policy_hour_interval" {
  description = "Backup policy hour interval"
  type        = number
  default     = 4
}

variable "backup_policy_log_frequency_minutes" {
  description = "Log backup frequency in minutes"
  type        = number
  default     = 30
}

variable "backup_policy_log_retention_count" {
  description = "Log backup retention count"
  type        = number
  default     = 30
}

variable "backup_policy_sql_retention_count" {
  description = "SQL backup retention count"
  type        = number
  default     = 30
}

variable "backup_policy_vm_default_retention_count" {
  description = "VM default backup retention count"
  type        = number
  default     = 35
}

variable "backup_policy_vm_enhanced_retention_count" {
  description = "VM enhanced backup retention count"
  type        = number
  default     = 35
}

# Backup Policy Time Settings
variable "backup_policy_enhanced_time" {
  description = "Enhanced backup policy backup time"
  type        = string
  default     = "08:00"
}

variable "backup_policy_sql_backup_time" {
  description = "SQL backup policy backup time"
  type        = string
  default     = "23:00"
}

# Activity Log Alert Webhook Properties
variable "activity_log_alert_webhook_service" {
  description = "Webhook Service property for activity log alerts"
  type        = string
  default     = "Azure Landing Zone Application Service"
}

variable "activity_log_alert_webhook_subtype" {
  description = "Webhook SubType property for activity log alerts"
  type        = string
  default     = "VM Health Degraded"
}

variable "activity_log_alert_webhook_type" {
  description = "Webhook Type property for activity log alerts"
  type        = string
  default     = "Performance"
}

# Automation Job Schedule Parameters
variable "automation_job_schedule_tag_name" {
  description = "Tag name for automation job schedules"
  type        = string
  default     = "operational_schedule"
}

variable "automation_job_schedule_tag_values" {
  description = "Tag values for automation job schedules mapped by schedule name"
  type        = map(string)
  default = {
    csspz_autoshutdown       = "csspz-autoshutdown"
    csspz_ie_office_hours    = "csspz-ie-office-hours"
    csspz_india_office_hours = "csspz-india-office-hours"
    csspz_eu_office_hours    = "csspz-eu-office-hours"
    tag_policy_remediation   = "TagPolicy"
    aum_attach_vm            = "CyberArk"
  }
}

# Automation Schedule Descriptions
variable "automation_schedule_descriptions" {
  description = "Descriptions for automation schedules"
  type        = map(string)
  default = {
    autoshutdown_patch_start       = "start VMs during ie patch office hours"
    autoshutdown_patch_stop        = "stop VMs during ie office hours"
    autoshutdown_stop              = "stop VMs during AutoShutdown hours"
    eu_office_hours_patch_start    = "start VMs during ie patch office hours"
    eu_office_hours_patch_stop     = "stop VMs during ie office hours"
    eu_office_hours_start          = "stop VMs during EU office hours"
    eu_office_hours_stop           = "stop VMs during EU office hours"
    ie_office_hours_patch_start    = "start VMs during ie patch office hours"
    ie_office_hours_patch_stop     = "stop VMs during ie office hours"
    ie_office_hours_start          = "start VMs during ie office hours"
    ie_office_hours_stop           = "stop VMs during ie office hours"
    india_office_hours_patch_start = "start VMs patch india office hours"
    india_office_hours_patch_stop  = "stop VMs patch india office hours"
    india_office_hours_start       = "start VMs during india office hours"
    india_office_hours_stop        = "stop VMs during india office hours"
    workload_mw_patch_nightly_12am = "Run every day at 12am"
    workload_mw_patch_nightly_12pm = "Run every day at 12pm"
  }
}

# Automation Schedule Week Days
variable "automation_schedule_patch_days" {
  description = "Week days for patch schedules"
  type        = list(string)
  default     = ["Tuesday"]
}

variable "automation_schedule_office_days" {
  description = "Week days for office hour schedules"
  type        = list(string)
  default     = ["Friday", "Monday", "Thursday", "Tuesday", "Wednesday"]
}

# Maintenance Configuration Settings
variable "maintenance_config_user_patch_mode" {
  description = "User patch mode for maintenance configurations"
  type        = string
  default     = "User"
}

variable "maintenance_window_reboot_policy" {
  description = "Reboot policy for maintenance windows"
  type        = string
  default     = "IfRequired"
}

variable "maintenance_config_linux_classifications" {
  description = "Linux patch classifications for maintenance"
  type        = list(string)
  default     = ["Critical", "Security"]
}

variable "maintenance_config_windows_classifications" {
  description = "Windows patch classifications for maintenance"
  type        = list(string)
  default     = ["Critical", "Security"]
}

variable "maintenance_window_recurrence_daily" {
  description = "Daily recurrence pattern for maintenance windows"
  type        = string
  default     = "1Day"
}

# Maintenance Window Start Dates - CRITICAL PARAMETRIZATION
variable "maintenance_window_start_dates" {
  description = "Start dates and times for maintenance windows (YYYY-MM-DD HH:MM format)"
  type        = map(string)
  default = {
    nightly_2am = "2025-07-03 02:00"
    nightly_3am = "2025-07-03 03:00"
    pilot_grp1  = "2025-08-05 02:00"
    pilot_grp2  = "2025-08-05 03:00"
    pilot_grp3  = "2025-08-05 04:00"
    prep_grp1   = "2025-07-15 02:00"
    prep_grp2   = "2025-07-16 02:00"
    prep_grp3   = "2025-07-17 02:00"
    prod_grp1   = "2025-07-22 02:00"
    prod_grp2   = "2025-07-23 02:00"
    prod_grp3   = "2025-07-24 02:00"
    test_grp1   = "2025-07-08 02:00"
    test_grp2   = "2025-07-08 03:00"
    test_grp3   = "2025-07-08 04:00"
  }
}

# Maintenance Window Durations (should match pattern)
variable "maintenance_window_time_duration" {
  description = "Time duration string for maintenance windows (HH:MM format)"
  type        = string
  default     = "04:00"
}

# Maintenance Configuration Recurrence Patterns
variable "maintenance_recurrence_patterns" {
  description = "Recurrence patterns for maintenance configurations"
  type        = map(string)
  default = {
    daily                  = "1Day"
    month_first_tuesday    = "Month First Tuesday"
    month_second_tuesday   = "Month Second Tuesday"
    month_third_tuesday    = "Month Third Tuesday"
    month_third_wednesday  = "Month Third Wednesday"
    month_third_thursday   = "Month Third Thursday"
    month_fourth_tuesday   = "Month Fourth Tuesday"
    month_fourth_wednesday = "Month Fourth Wednesday"
    month_fourth_thursday  = "Month Fourth Thursday"
  }
}

# VM Network Interface Configuration
variable "vm_network_interface_resource_group" {
  description = "Resource group for VM network interfaces"
  type        = string
  default     = "M-CSSPZ-RG-MAN-PRD-003"
}

# VM Security Settings
variable "vm_cyberark_secure_boot_enabled" {
  description = "Enable secure boot for CyberArk VM"
  type        = bool
  default     = true
}

variable "vm_cyberark_vtpm_enabled" {
  description = "Enable vTPM for CyberArk VM"
  type        = bool
  default     = true
}

variable "vm_cyberark_availability_zone" {
  description = "Availability zone for CyberArk VM"
  type        = string
  default     = "1"
}

# Public IP Availability Zones
variable "public_ip_availability_zones" {
  description = "Availability zones for public IP"
  type        = list(string)
  default     = ["1"]
}

# Metric Alert Settings
variable "metric_alert_severity_level" {
  description = "Severity level for metric alerts"
  type        = number
  default     = 2
}

variable "metric_alert_aggregation" {
  description = "Aggregation method for metric alerts"
  type        = string
  default     = "Average"
}

variable "metric_alert_metric_names" {
  description = "Metric names for monitoring alerts"
  type        = map(string)
  default = {
    total_job = "TotalJob"
  }
}

variable "metric_alert_metric_namespace" {
  description = "Metric namespace for alerts"
  type        = string
  default     = "Microsoft.Automation/automationAccounts"
}

variable "metric_alert_operator" {
  description = "Comparison operator for metric alert threshold"
  type        = string
  default     = "GreaterThan"
}

variable "metric_alert_threshold_total_job" {
  description = "Threshold value for total job metric alert"
  type        = number
  default     = 0
}

variable "metric_alert_dimension_exclusions" {
  description = "Dimension filters for metric alerts"
  type = map(object({
    operator = string
    values   = list(string)
  }))
  default = {
    status = {
      operator = "Exclude"
      values   = ["Completed"]
    }
  }
}

# VM Extension Handler Versions
variable "vm_extension_mde_handler_version" {
  description = "Handler version for MDE extension"
  type        = string
  default     = "1.0"
}

variable "vm_extension_vmaccess_handler_version" {
  description = "Handler version for VMAccess extension"
  type        = string
  default     = "2.0"
}

variable "vm_extension_azmonitor_handler_version" {
  description = "Handler version for Azure Monitor extension"
  type        = string
  default     = "1.0"
}

# VM Extension MDE Settings
variable "vm_extension_mde_auto_update" {
  description = "Enable auto-update for MDE extension"
  type        = bool
  default     = true
}

variable "vm_extension_mde_force_reonboarding" {
  description = "Force re-onboarding for MDE extension"
  type        = bool
  default     = false
}

variable "vm_extension_mde_vnext_enabled" {
  description = "Enable vNext for MDE extension"
  type        = bool
  default     = true
}

# Disk Encryption Set Resource Group
variable "disk_encryption_set_resource_group" {
  description = "Resource group for disk encryption sets"
  type        = string
  default     = "M-CSSPZ-RG-MAN-PRD-004"
}

# VM Managed Disk Name
variable "managed_disk_vm_name" {
  description = "Name of the managed disk for OVOC image"
  type        = string
  default     = "M-CSSPZ-OVOC-IMAGE_OsDisk_1_23e74f38e4c04fccaa56f89b7780dd34"
}

# VM Ovoc Image Line Variables
variable "ovoc_vm_line" {
  description = "Line/reference ID for OVOC VM"
  type        = string
  default     = "1"
}

# Additional VM NICs resource group
variable "vm_nics_resource_group" {
  description = "Resource group for VM network interfaces"
  type        = string
  default     = "M-CSSPZ-RG-MAN-PRD-003"
}
# Automation Schedule Frequency
variable "automation_schedule_frequency_week" {
  description = "Schedule frequency for weekly schedules"
  type        = string
  default     = "Week"
}

variable "automation_schedule_frequency_oneday" {
  description = "Schedule frequency for one-day schedules"
  type        = string
  default     = "OneDay"
}
