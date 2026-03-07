resource "azurerm_resource_group" "res-0" {
  location = "northeurope"
  name     = "R-CSSPZ-RG-MAN-PRD-006"
  tags = {
    "Account Type"            = "PLACEHOLDER"
    AppSupport                = "PLACEHOLDER"
    "BOI Application"         = "PLACEHOLDER"
    "BOI Application Service" = "PLACEHOLDER"
    BusinessUnit              = "PLACEHOLDER"
    Compliance                = "PLACEHOLDER"
    Confidentiality           = "PLACEHOLDER"
    CostCentre                = "FD2000"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PRD"
    InfraSupport              = "HCL-VIP-Support"
    Name                      = "PLACEHOLDER"
    OperatingSystem           = "PLACEHOLDER"
    Owner                     = "Daniel Dalla"
    PII                       = "PLACEHOLDER"
    Project                   = "PLACEHOLDER"
    ServerCriticality         = "PLACEHOLDER"
  }
}
resource "azurerm_recovery_services_vault" "res-1" {
  location            = "northeurope"
  name                = "casbvm-recovery-services-vault"
  resource_group_name = "R-CSSPZ-RG-MAN-PRD-006"
  sku                 = "Standard"
  tags = {
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
    CostCentre                = "PLACEHOLDER"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
    "Infra Support"           = "PLACEHOLDER"
    InfraSupport              = "PLACEHOLDER"
    "Log Level"               = "PLACEHOLDER"
    "Log Zone"                = "PLACEHOLDER"
    MaintWinPatch             = "PLACEHOLDER"
    MaintWinPatchScan         = "PLACEHOLDER"
    Name                      = "PLACEHOLDER"
    "Operating System"        = "PLACEHOLDER"
    OperatingSystem           = "PLACEHOLDER"
    "Operational Status"      = "PLACEHOLDER"
    Owner                     = "PLACEHOLDER"
    PII                       = "PLACEHOLDER"
    "Patch Group"             = "PLACEHOLDER"
    Project                   = "PLACEHOLDER"
    "Server Criticality"      = "PLACEHOLDER"
    ServerCriticality         = "PLACEHOLDER"
    "Support Groups"          = "PLACEHOLDER"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_backup_policy_vm" "res-2" {
  name                = "DefaultPolicy"
  recovery_vault_name = "casbvm-recovery-services-vault"
  resource_group_name = "R-CSSPZ-RG-MAN-PRD-006"
  backup {
    frequency = "Daily"
    time      = "18:30"
  }
  retention_daily {
    count = 30
  }
  depends_on = [
    azurerm_recovery_services_vault.res-1,
  ]
}
resource "azurerm_backup_policy_vm" "res-3" {
  name                = "EnhancedPolicy"
  policy_type         = "V2"
  recovery_vault_name = "casbvm-recovery-services-vault"
  resource_group_name = "R-CSSPZ-RG-MAN-PRD-006"
  backup {
    frequency     = "Hourly"
    hour_duration = 12
    hour_interval = 4
    time          = "08:00"
  }
  retention_daily {
    count = 30
  }
  depends_on = [
    azurerm_recovery_services_vault.res-1,
  ]
}
resource "azurerm_backup_policy_vm_workload" "res-4" {
  name                = "HourlyLogBackup"
  recovery_vault_name = "casbvm-recovery-services-vault"
  resource_group_name = "R-CSSPZ-RG-MAN-PRD-006"
  workload_type       = "SQLDataBase"
  protection_policy {
    policy_type = "Log"
    backup {
      frequency_in_minutes = 60
    }
    simple_retention {
      count = 30
    }
  }
  protection_policy {
    policy_type = "Full"
    backup {
      frequency = "Daily"
      time      = "18:30"
    }
    retention_daily {
      count = 30
    }
  }
  settings {
    time_zone = "UTC"
  }
  depends_on = [
    azurerm_recovery_services_vault.res-1,
  ]
}
