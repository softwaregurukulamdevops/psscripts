resource "azurerm_resource_group" "res-0" {
  location = "northeurope"
  name     = "R-CSSPZ-RG-MAN-PRD-007"
  tags = {
    "Account Type"            = "PLACEHOLDER"
    AccountType               = "PLACEHOLDER"
    AppSupport                = "PLACEHOLDER"
    "BOI Application"         = "PLACEHOLDER"
    "BOI Application Service" = "PLACEHOLDER"
    BOIApplication            = "PLACEHOLDER"
    BOIApplicationService     = ""
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
resource "azurerm_virtual_machine_extension" "res-1" {
  auto_upgrade_minor_version = true
  name                       = "MDE.Linux"
  publisher                  = "Microsoft.Azure.AzureDefenderForServers"
  settings = jsonencode({
    autoUpdate        = true
    azureResourceId   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-001"
    forceReOnboarding = false
    vNextEnabled      = false
  })
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "MDE.Linux"
  type_handler_version = "1.0"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-001"
  depends_on = [
    azurerm_linux_virtual_machine.res-87,
  ]
}
resource "azurerm_virtual_machine_extension" "res-2" {
  auto_upgrade_minor_version = true
  name                       = "MDE.Linux"
  publisher                  = "Microsoft.Azure.AzureDefenderForServers"
  settings = jsonencode({
    autoUpdate        = true
    azureResourceId   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-002"
    forceReOnboarding = false
    vNextEnabled      = false
  })
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "MDE.Linux"
  type_handler_version = "1.0"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-002"
  depends_on = [
    azurerm_linux_virtual_machine.res-89,
  ]
}
resource "azurerm_virtual_machine_extension" "res-3" {
  auto_upgrade_minor_version = true
  name                       = "MDE.Linux"
  publisher                  = "Microsoft.Azure.AzureDefenderForServers"
  settings = jsonencode({
    autoUpdate        = true
    azureResourceId   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-003"
    forceReOnboarding = false
    vNextEnabled      = false
  })
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "MDE.Linux"
  type_handler_version = "1.0"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-003"
  depends_on = [
    azurerm_linux_virtual_machine.res-91,
  ]
}
resource "azurerm_virtual_machine_extension" "res-4" {
  auto_upgrade_minor_version = true
  name                       = "MDE.Linux"
  publisher                  = "Microsoft.Azure.AzureDefenderForServers"
  settings = jsonencode({
    autoUpdate        = true
    azureResourceId   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-004"
    forceReOnboarding = false
    vNextEnabled      = false
  })
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "MDE.Linux"
  type_handler_version = "1.0"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-004"
  depends_on = [
    azurerm_linux_virtual_machine.res-93,
  ]
}
resource "azurerm_virtual_machine_extension" "res-5" {
  auto_upgrade_minor_version = true
  name                       = "MDE.Linux"
  publisher                  = "Microsoft.Azure.AzureDefenderForServers"
  settings = jsonencode({
    autoUpdate        = true
    azureResourceId   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-005"
    forceReOnboarding = false
    vNextEnabled      = false
  })
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "MDE.Linux"
  type_handler_version = "1.0"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-005"
  depends_on = [
    azurerm_linux_virtual_machine.res-95,
  ]
}
resource "azurerm_virtual_machine_extension" "res-6" {
  auto_upgrade_minor_version = true
  name                       = "MDE.Linux"
  publisher                  = "Microsoft.Azure.AzureDefenderForServers"
  settings = jsonencode({
    autoUpdate        = true
    azureResourceId   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-006"
    forceReOnboarding = false
    vNextEnabled      = false
  })
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "MDE.Linux"
  type_handler_version = "1.0"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-006"
  depends_on = [
    azurerm_linux_virtual_machine.res-97,
  ]
}
resource "azurerm_virtual_machine_extension" "res-7" {
  auto_upgrade_minor_version = true
  name                       = "MDE.Linux"
  publisher                  = "Microsoft.Azure.AzureDefenderForServers"
  settings = jsonencode({
    autoUpdate        = true
    azureResourceId   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-007"
    forceReOnboarding = false
    vNextEnabled      = false
  })
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "MDE.Linux"
  type_handler_version = "1.0"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-007"
  depends_on = [
    azurerm_linux_virtual_machine.res-99,
  ]
}
resource "azurerm_virtual_machine_extension" "res-8" {
  auto_upgrade_minor_version = true
  name                       = "MDE.Linux"
  publisher                  = "Microsoft.Azure.AzureDefenderForServers"
  settings = jsonencode({
    autoUpdate        = true
    azureResourceId   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-008"
    forceReOnboarding = false
    vNextEnabled      = false
  })
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "MDE.Linux"
  type_handler_version = "1.0"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-008"
  depends_on = [
    azurerm_linux_virtual_machine.res-101,
  ]
}
resource "azurerm_virtual_machine_extension" "res-9" {
  auto_upgrade_minor_version = true
  name                       = "MDE.Linux"
  publisher                  = "Microsoft.Azure.AzureDefenderForServers"
  settings = jsonencode({
    autoUpdate        = true
    azureResourceId   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-009"
    forceReOnboarding = false
    vNextEnabled      = false
  })
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "MDE.Linux"
  type_handler_version = "1.0"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-009"
  depends_on = [
    azurerm_linux_virtual_machine.res-103,
  ]
}
resource "azurerm_virtual_machine_extension" "res-10" {
  auto_upgrade_minor_version = true
  name                       = "MDE.Linux"
  publisher                  = "Microsoft.Azure.AzureDefenderForServers"
  settings = jsonencode({
    autoUpdate        = true
    azureResourceId   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-010"
    forceReOnboarding = false
    vNextEnabled      = false
  })
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "MDE.Linux"
  type_handler_version = "1.0"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-010"
  depends_on = [
    azurerm_linux_virtual_machine.res-106,
  ]
}
resource "azurerm_virtual_machine_extension" "res-11" {
  auto_upgrade_minor_version = true
  name                       = "MDE.Linux"
  publisher                  = "Microsoft.Azure.AzureDefenderForServers"
  settings = jsonencode({
    autoUpdate        = true
    azureResourceId   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-011"
    forceReOnboarding = false
    vNextEnabled      = false
  })
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "MDE.Linux"
  type_handler_version = "1.0"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-011"
  depends_on = [
    azurerm_linux_virtual_machine.res-108,
  ]
}
resource "azurerm_virtual_machine_extension" "res-12" {
  auto_upgrade_minor_version = true
  name                       = "MDE.Linux"
  publisher                  = "Microsoft.Azure.AzureDefenderForServers"
  settings = jsonencode({
    autoUpdate        = true
    azureResourceId   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-012"
    forceReOnboarding = false
    vNextEnabled      = false
  })
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "MDE.Linux"
  type_handler_version = "1.0"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-012"
  depends_on = [
    azurerm_linux_virtual_machine.res-111,
  ]
}
resource "azurerm_arc_machine_extension" "res-14" {
  arc_machine_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.HybridCompute/machines/vm000005738"
  location       = "northeurope"
  name           = "AzureMonitorWindowsAgent"
  publisher      = "Microsoft.Azure.Monitor"
  settings = jsonencode({
    proxy = {
      mode = "none"
    }
  })
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "AzureMonitorWindowsAgent"
  type_handler_version = "1.32.0.0"
}
resource "azurerm_arc_machine_extension" "res-15" {
  arc_machine_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.HybridCompute/machines/vm000005738"
  location       = "northeurope"
  name           = "MDE.Windows"
  publisher      = "Microsoft.Azure.AzureDefenderForServers"
  settings = jsonencode({
    autoUpdate        = true
    azureResourceId   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.HybridCompute/machines/vm000005738"
    forceReOnboarding = false
    vNextEnabled      = true
  })
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "MDE.Windows"
  type_handler_version = "1.0.11.3"
}
resource "azurerm_arc_machine_extension" "res-16" {
  arc_machine_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.HybridCompute/machines/vm000005738"
  location       = "northeurope"
  name           = "WindowsPatchExtension"
  publisher      = "Microsoft.CPlat.Core"
  settings = jsonencode({
    activityId                = "5f9d8b28-bb2c-44aa-95a2-49c9d945efb6"
    assessmentMode            = "AutomaticByPlatform"
    cloudType                 = "Arc"
    maximumAssessmentInterval = "PT12H"
    maximumDuration           = "PT60M"
    operation                 = "ConfigurePatching"
    startTime                 = "2026-03-06T20:44:21.9270926+00:00"
  })
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "WindowsPatchExtension"
  type_handler_version = "1.5.80"
}
resource "azurerm_arc_machine_extension" "res-18" {
  arc_machine_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.HybridCompute/machines/vm000005739"
  location       = "northeurope"
  name           = "AzureMonitorWindowsAgent"
  publisher      = "Microsoft.Azure.Monitor"
  settings = jsonencode({
    proxy = {
      mode = "none"
    }
  })
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "AzureMonitorWindowsAgent"
  type_handler_version = "1.30.0.0"
}
resource "azurerm_arc_machine_extension" "res-19" {
  arc_machine_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.HybridCompute/machines/vm000005739"
  location       = "northeurope"
  name           = "MDE.Windows"
  publisher      = "Microsoft.Azure.AzureDefenderForServers"
  settings = jsonencode({
    autoUpdate        = true
    azureResourceId   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.HybridCompute/machines/vm000005739"
    forceReOnboarding = false
    vNextEnabled      = true
  })
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "MDE.Windows"
  type_handler_version = "1.0.13.0"
}
resource "azurerm_arc_machine_extension" "res-20" {
  arc_machine_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.HybridCompute/machines/vm000005739"
  location       = "northeurope"
  name           = "WindowsOsUpdateExtension"
  publisher      = "Microsoft.SoftwareUpdateManagement"
  settings = jsonencode({
    updateConfiguration = {
      action     = "Assessment"
      activityId = "1b1d8489-b1a7-4f9f-bc41-7b5ac1be6d1b"
      startTime  = "2024-05-28T11:57:20.4574Z"
    }
  })
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "WindowsOsUpdateExtension"
  type_handler_version = "1.0.26.0"
}
resource "azurerm_arc_machine_extension" "res-21" {
  arc_machine_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.HybridCompute/machines/vm000005739"
  location       = "northeurope"
  name           = "WindowsPatchExtension"
  publisher      = "Microsoft.CPlat.Core"
  settings = jsonencode({
    activityId                = "80d3de17-9b91-4e51-935c-53e75c4024c9"
    assessmentMode            = "AutomaticByPlatform"
    cloudType                 = "Arc"
    maximumAssessmentInterval = "PT12H"
    maximumDuration           = "PT60M"
    operation                 = "ConfigurePatching"
    startTime                 = "2026-03-06T20:44:21.438995+00:00"
  })
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
  type                 = "WindowsPatchExtension"
  type_handler_version = "1.5.80"
}
resource "azurerm_lb" "res-22" {
  location            = "northeurope"
  name                = "R-CSSPZ-LB-MAN-PRD-003"
  resource_group_name = "R-CSSPZ-RG-MAN-PRD-007"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  frontend_ip_configuration {
    name = "ExternalSyslogLB-IP"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_lb_backend_address_pool" "res-23" {
  loadbalancer_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/loadBalancers/R-CSSPZ-LB-MAN-PRD-003"
  name            = "R-CSSPZ-BEPOOL-MAN-PRD-003"
  depends_on = [
    azurerm_lb.res-22,
  ]
}
resource "azurerm_lb_rule" "res-24" {
  backend_address_pool_ids       = ["/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/loadBalancers/R-CSSPZ-LB-MAN-PRD-003/backendAddressPools/R-CSSPZ-BEPOOL-MAN-PRD-003"]
  backend_port                   = 6514
  frontend_ip_configuration_name = "ExternalSyslogLB-IP"
  frontend_port                  = 6514
  loadbalancer_id                = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/loadBalancers/R-CSSPZ-LB-MAN-PRD-003"
  name                           = "ExternalSyslogLBRule-6514-Syslog-001"
  protocol                       = "Tcp"
  depends_on = [
    azurerm_lb_backend_address_pool.res-23,
  ]
}
resource "azurerm_lb_probe" "res-25" {
  interval_in_seconds = 5
  loadbalancer_id     = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/loadBalancers/R-CSSPZ-LB-MAN-PRD-003"
  name                = "514prb"
  number_of_probes    = 1
  port                = 514
  depends_on = [
    azurerm_lb.res-22,
  ]
}
resource "azurerm_lb_probe" "res-26" {
  loadbalancer_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/loadBalancers/R-CSSPZ-LB-MAN-PRD-003"
  name            = "ExternalSyslog-HealthProbe"
  port            = 6514
  depends_on = [
    azurerm_lb.res-22,
  ]
}
resource "azurerm_lb" "res-27" {
  location            = "northeurope"
  name                = "R-CSSPZ-LB-MAN-PRD-004"
  resource_group_name = "R-CSSPZ-RG-MAN-PRD-007"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  frontend_ip_configuration {
    name = "InternalSyslogLB-IP"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_lb_backend_address_pool" "res-28" {
  loadbalancer_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/loadBalancers/R-CSSPZ-LB-MAN-PRD-004"
  name            = "R-CSSPZ-BEPOOL-MAN-PRD-004"
  depends_on = [
    azurerm_lb.res-27,
  ]
}
resource "azurerm_lb_rule" "res-29" {
  backend_address_pool_ids       = ["/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/loadBalancers/R-CSSPZ-LB-MAN-PRD-004/backendAddressPools/R-CSSPZ-BEPOOL-MAN-PRD-004"]
  backend_port                   = 514
  frontend_ip_configuration_name = "InternalSyslogLB-IP"
  frontend_port                  = 514
  loadbalancer_id                = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/loadBalancers/R-CSSPZ-LB-MAN-PRD-004"
  name                           = "InternalSyslogLBRule-FE-TCP-514"
  protocol                       = "Tcp"
  depends_on = [
    azurerm_lb_backend_address_pool.res-28,
  ]
}
resource "azurerm_lb_rule" "res-30" {
  backend_address_pool_ids       = ["/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/loadBalancers/R-CSSPZ-LB-MAN-PRD-004/backendAddressPools/R-CSSPZ-BEPOOL-MAN-PRD-004"]
  backend_port                   = 6514
  frontend_ip_configuration_name = "InternalSyslogLB-IP"
  frontend_port                  = 6514
  loadbalancer_id                = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/loadBalancers/R-CSSPZ-LB-MAN-PRD-004"
  name                           = "InternalSyslogLBRule-FE-TCP-6514"
  protocol                       = "Tcp"
  depends_on = [
    azurerm_lb_backend_address_pool.res-28,
  ]
}
resource "azurerm_lb_rule" "res-31" {
  backend_address_pool_ids       = ["/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/loadBalancers/R-CSSPZ-LB-MAN-PRD-004/backendAddressPools/R-CSSPZ-BEPOOL-MAN-PRD-004"]
  backend_port                   = 514
  frontend_ip_configuration_name = "InternalSyslogLB-IP"
  frontend_port                  = 514
  loadbalancer_id                = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/loadBalancers/R-CSSPZ-LB-MAN-PRD-004"
  name                           = "InternalSyslogLBRule-FE-UDP-514"
  protocol                       = "Udp"
  depends_on = [
    azurerm_lb_backend_address_pool.res-28,
  ]
}
resource "azurerm_lb_probe" "res-32" {
  loadbalancer_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/loadBalancers/R-CSSPZ-LB-MAN-PRD-004"
  name            = "InternalSyslog-HealthProbe"
  port            = 6514
  depends_on = [
    azurerm_lb.res-27,
  ]
}
resource "azurerm_network_interface" "res-33" {
  location            = "northeurope"
  name                = "R-CSSPZ-VM-LGS-MAN-PRD-001-NIC"
  resource_group_name = "R-CSSPZ-RG-MAN-PRD-007"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  ip_configuration {
    name                          = "IpConf"
    private_ip_address_allocation = "Static"
    subnet_id                     = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-001/providers/Microsoft.Network/virtualNetworks/M-CSSPZ-VNET-MAN-PRD-001/subnets/R-CSSPZ-SNET-MAN-PRD-006"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_network_interface_backend_address_pool_association" "res-34" {
  backend_address_pool_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/loadBalancers/R-CSSPZ-LB-MAN-PRD-004/backendAddressPools/R-CSSPZ-BEPOOL-MAN-PRD-004"
  ip_configuration_name   = "IpConf"
  network_interface_id    = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/networkInterfaces/R-CSSPZ-VM-LGS-MAN-PRD-001-NIC"
  depends_on = [
    azurerm_lb_backend_address_pool.res-28,
    azurerm_network_interface.res-33,
  ]
}
resource "azurerm_network_interface" "res-35" {
  location            = "northeurope"
  name                = "R-CSSPZ-VM-LGS-MAN-PRD-002-NIC"
  resource_group_name = "R-CSSPZ-RG-MAN-PRD-007"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  ip_configuration {
    name                          = "IpConf"
    private_ip_address_allocation = "Static"
    subnet_id                     = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-001/providers/Microsoft.Network/virtualNetworks/M-CSSPZ-VNET-MAN-PRD-001/subnets/R-CSSPZ-SNET-MAN-PRD-006"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_network_interface_backend_address_pool_association" "res-36" {
  backend_address_pool_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/loadBalancers/R-CSSPZ-LB-MAN-PRD-004/backendAddressPools/R-CSSPZ-BEPOOL-MAN-PRD-004"
  ip_configuration_name   = "IpConf"
  network_interface_id    = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/networkInterfaces/R-CSSPZ-VM-LGS-MAN-PRD-002-NIC"
  depends_on = [
    azurerm_lb_backend_address_pool.res-28,
    azurerm_network_interface.res-35,
  ]
}
resource "azurerm_network_interface" "res-37" {
  location            = "northeurope"
  name                = "R-CSSPZ-VM-LGS-MAN-PRD-003-NIC"
  resource_group_name = "R-CSSPZ-RG-MAN-PRD-007"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  ip_configuration {
    name                          = "IpConf"
    private_ip_address_allocation = "Static"
    subnet_id                     = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-001/providers/Microsoft.Network/virtualNetworks/M-CSSPZ-VNET-MAN-PRD-001/subnets/R-CSSPZ-SNET-MAN-PRD-006"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_network_interface_backend_address_pool_association" "res-38" {
  backend_address_pool_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/loadBalancers/R-CSSPZ-LB-MAN-PRD-004/backendAddressPools/R-CSSPZ-BEPOOL-MAN-PRD-004"
  ip_configuration_name   = "IpConf"
  network_interface_id    = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/networkInterfaces/R-CSSPZ-VM-LGS-MAN-PRD-003-NIC"
  depends_on = [
    azurerm_lb_backend_address_pool.res-28,
    azurerm_network_interface.res-37,
  ]
}
resource "azurerm_network_interface" "res-39" {
  location            = "northeurope"
  name                = "R-CSSPZ-VM-LGS-MAN-PRD-004-NIC"
  resource_group_name = "R-CSSPZ-RG-MAN-PRD-007"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  ip_configuration {
    name                          = "IpConf"
    private_ip_address_allocation = "Static"
    subnet_id                     = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-001/providers/Microsoft.Network/virtualNetworks/M-CSSPZ-VNET-MAN-PRD-001/subnets/R-CSSPZ-SNET-MAN-PRD-006"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_network_interface_backend_address_pool_association" "res-40" {
  backend_address_pool_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/loadBalancers/R-CSSPZ-LB-MAN-PRD-004/backendAddressPools/R-CSSPZ-BEPOOL-MAN-PRD-004"
  ip_configuration_name   = "IpConf"
  network_interface_id    = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/networkInterfaces/R-CSSPZ-VM-LGS-MAN-PRD-004-NIC"
  depends_on = [
    azurerm_lb_backend_address_pool.res-28,
    azurerm_network_interface.res-39,
  ]
}
resource "azurerm_network_interface" "res-41" {
  location            = "northeurope"
  name                = "R-CSSPZ-VM-LGS-MAN-PRD-005-NIC"
  resource_group_name = "R-CSSPZ-RG-MAN-PRD-007"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  ip_configuration {
    name                          = "IpConf"
    private_ip_address_allocation = "Static"
    subnet_id                     = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-001/providers/Microsoft.Network/virtualNetworks/M-CSSPZ-VNET-MAN-PRD-001/subnets/R-CSSPZ-SNET-MAN-PRD-006"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_network_interface_backend_address_pool_association" "res-42" {
  backend_address_pool_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/loadBalancers/R-CSSPZ-LB-MAN-PRD-004/backendAddressPools/R-CSSPZ-BEPOOL-MAN-PRD-004"
  ip_configuration_name   = "IpConf"
  network_interface_id    = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/networkInterfaces/R-CSSPZ-VM-LGS-MAN-PRD-005-NIC"
  depends_on = [
    azurerm_lb_backend_address_pool.res-28,
    azurerm_network_interface.res-41,
  ]
}
resource "azurerm_network_interface" "res-43" {
  location            = "northeurope"
  name                = "R-CSSPZ-VM-LGS-MAN-PRD-006-NIC"
  resource_group_name = "R-CSSPZ-RG-MAN-PRD-007"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  ip_configuration {
    name                          = "IpConf"
    private_ip_address_allocation = "Static"
    subnet_id                     = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-001/providers/Microsoft.Network/virtualNetworks/M-CSSPZ-VNET-MAN-PRD-001/subnets/R-CSSPZ-SNET-MAN-PRD-006"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_network_interface_backend_address_pool_association" "res-44" {
  backend_address_pool_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/loadBalancers/R-CSSPZ-LB-MAN-PRD-004/backendAddressPools/R-CSSPZ-BEPOOL-MAN-PRD-004"
  ip_configuration_name   = "IpConf"
  network_interface_id    = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/networkInterfaces/R-CSSPZ-VM-LGS-MAN-PRD-006-NIC"
  depends_on = [
    azurerm_lb_backend_address_pool.res-28,
    azurerm_network_interface.res-43,
  ]
}
resource "azurerm_network_interface" "res-45" {
  location            = "northeurope"
  name                = "R-CSSPZ-VM-LGS-MAN-PRD-007-NIC"
  resource_group_name = "R-CSSPZ-RG-MAN-PRD-007"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  ip_configuration {
    name                          = "IpConf"
    private_ip_address_allocation = "Static"
    subnet_id                     = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-001/providers/Microsoft.Network/virtualNetworks/M-CSSPZ-VNET-MAN-PRD-001/subnets/R-CSSPZ-SNET-MAN-PRD-006"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_network_interface_backend_address_pool_association" "res-46" {
  backend_address_pool_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/loadBalancers/R-CSSPZ-LB-MAN-PRD-004/backendAddressPools/R-CSSPZ-BEPOOL-MAN-PRD-004"
  ip_configuration_name   = "IpConf"
  network_interface_id    = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/networkInterfaces/R-CSSPZ-VM-LGS-MAN-PRD-007-NIC"
  depends_on = [
    azurerm_lb_backend_address_pool.res-28,
    azurerm_network_interface.res-45,
  ]
}
resource "azurerm_network_interface" "res-47" {
  location            = "northeurope"
  name                = "R-CSSPZ-VM-LGS-MAN-PRD-008-NIC"
  resource_group_name = "R-CSSPZ-RG-MAN-PRD-007"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  ip_configuration {
    name                          = "IpConf"
    private_ip_address_allocation = "Static"
    subnet_id                     = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-001/providers/Microsoft.Network/virtualNetworks/M-CSSPZ-VNET-MAN-PRD-001/subnets/R-CSSPZ-SNET-MAN-PRD-006"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_network_interface_backend_address_pool_association" "res-48" {
  backend_address_pool_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/loadBalancers/R-CSSPZ-LB-MAN-PRD-004/backendAddressPools/R-CSSPZ-BEPOOL-MAN-PRD-004"
  ip_configuration_name   = "IpConf"
  network_interface_id    = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/networkInterfaces/R-CSSPZ-VM-LGS-MAN-PRD-008-NIC"
  depends_on = [
    azurerm_lb_backend_address_pool.res-28,
    azurerm_network_interface.res-47,
  ]
}
resource "azurerm_network_interface" "res-49" {
  location            = "northeurope"
  name                = "R-CSSPZ-VM-LGS-MAN-PRD-009-NIC"
  resource_group_name = "R-CSSPZ-RG-MAN-PRD-007"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  ip_configuration {
    name                          = "IpConf"
    private_ip_address_allocation = "Static"
    subnet_id                     = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-001/providers/Microsoft.Network/virtualNetworks/M-CSSPZ-VNET-MAN-PRD-001/subnets/R-CSSPZ-SNET-MAN-PRD-006"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_network_interface_backend_address_pool_association" "res-50" {
  backend_address_pool_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/loadBalancers/R-CSSPZ-LB-MAN-PRD-004/backendAddressPools/R-CSSPZ-BEPOOL-MAN-PRD-004"
  ip_configuration_name   = "IpConf"
  network_interface_id    = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/networkInterfaces/R-CSSPZ-VM-LGS-MAN-PRD-009-NIC"
  depends_on = [
    azurerm_lb_backend_address_pool.res-28,
    azurerm_network_interface.res-49,
  ]
}
resource "azurerm_network_interface" "res-51" {
  location            = "northeurope"
  name                = "R-CSSPZ-VM-LGS-MAN-PRD-010-NIC"
  resource_group_name = "R-CSSPZ-RG-MAN-PRD-007"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  ip_configuration {
    name                          = "IpConf"
    private_ip_address_allocation = "Static"
    subnet_id                     = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-001/providers/Microsoft.Network/virtualNetworks/M-CSSPZ-VNET-MAN-PRD-001/subnets/R-CSSPZ-SNET-MAN-PRD-006"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_network_interface_backend_address_pool_association" "res-52" {
  backend_address_pool_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/loadBalancers/R-CSSPZ-LB-MAN-PRD-004/backendAddressPools/R-CSSPZ-BEPOOL-MAN-PRD-004"
  ip_configuration_name   = "IpConf"
  network_interface_id    = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/networkInterfaces/R-CSSPZ-VM-LGS-MAN-PRD-010-NIC"
  depends_on = [
    azurerm_lb_backend_address_pool.res-28,
    azurerm_network_interface.res-51,
  ]
}
resource "azurerm_network_interface" "res-53" {
  location            = "northeurope"
  name                = "R-CSSPZ-VM-LGS-MAN-PRD-011-NIC"
  resource_group_name = "R-CSSPZ-RG-MAN-PRD-007"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  ip_configuration {
    name                          = "IpConf"
    private_ip_address_allocation = "Static"
    subnet_id                     = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-001/providers/Microsoft.Network/virtualNetworks/M-CSSPZ-VNET-MAN-PRD-001/subnets/R-CSSPZ-SNET-MAN-PRD-006"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_network_interface_backend_address_pool_association" "res-54" {
  backend_address_pool_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/loadBalancers/R-CSSPZ-LB-MAN-PRD-003/backendAddressPools/R-CSSPZ-BEPOOL-MAN-PRD-003"
  ip_configuration_name   = "IpConf"
  network_interface_id    = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/networkInterfaces/R-CSSPZ-VM-LGS-MAN-PRD-011-NIC"
  depends_on = [
    azurerm_lb_backend_address_pool.res-23,
    azurerm_network_interface.res-53,
  ]
}
resource "azurerm_network_interface" "res-55" {
  location            = "northeurope"
  name                = "R-CSSPZ-VM-LGS-MAN-PRD-012-NIC"
  resource_group_name = "R-CSSPZ-RG-MAN-PRD-007"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  ip_configuration {
    name                          = "IpConf"
    private_ip_address_allocation = "Static"
    subnet_id                     = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-001/providers/Microsoft.Network/virtualNetworks/M-CSSPZ-VNET-MAN-PRD-001/subnets/R-CSSPZ-SNET-MAN-PRD-006"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_network_interface_backend_address_pool_association" "res-56" {
  backend_address_pool_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/loadBalancers/R-CSSPZ-LB-MAN-PRD-003/backendAddressPools/R-CSSPZ-BEPOOL-MAN-PRD-003"
  ip_configuration_name   = "IpConf"
  network_interface_id    = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/networkInterfaces/R-CSSPZ-VM-LGS-MAN-PRD-012-NIC"
  depends_on = [
    azurerm_lb_backend_address_pool.res-23,
    azurerm_network_interface.res-55,
  ]
}
resource "azurerm_monitor_metric_alert" "res-57" {
  name                = "LogCollector-LogStash Servers CPU Alerts"
  resource_group_name = "R-CSSPZ-RG-MAN-PRD-007"
  scopes              = ["/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-001", "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-002", "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-003", "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-004", "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-005", "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-006", "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-007", "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-008", "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-011", "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-012", "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-009", "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-010"]
  severity            = 2
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  action {
    action_group_id = "/subscriptions/6088F278-2D38-4BDD-9E08-E5417D44AF11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/microsoft.insights/actionGroups/VIPSupport"
  }
  criteria {
    aggregation      = "Average"
    metric_name      = "Percentage CPU"
    metric_namespace = "microsoft.compute/virtualmachines"
    operator         = "GreaterThan"
    threshold        = 80
  }
  depends_on = [
    azurerm_linux_virtual_machine.res-103,
    azurerm_linux_virtual_machine.res-106,
  ]
}
resource "azurerm_monitor_metric_alert" "res-58" {
  description         = "LogCollectors-LogStash Available Memory is Less than 3GB"
  name                = "LogCollectors-LogStash Available Memory is Less than 3GB"
  resource_group_name = "R-CSSPZ-RG-MAN-PRD-007"
  scopes              = ["/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-001", "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-002", "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-003", "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-004", "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-005", "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-006", "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-007", "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-008", "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-011", "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-012", "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-009", "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-010"]
  severity            = 2
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  action {
    action_group_id = "/subscriptions/6088F278-2D38-4BDD-9E08-E5417D44AF11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/microsoft.insights/actionGroups/VIPSupport"
  }
  criteria {
    aggregation      = "Minimum"
    metric_name      = "Available Memory Bytes"
    metric_namespace = "microsoft.compute/virtualmachines"
    operator         = "LessThanOrEqual"
    threshold        = 3000000000
  }
  depends_on = [
    azurerm_linux_virtual_machine.res-103,
    azurerm_linux_virtual_machine.res-106,
  ]
}
resource "azurerm_managed_disk" "res-59" {
  create_option              = "FromImage"
  gallery_image_reference_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/m-csspz-rg-man-prd-004/providers/Microsoft.Compute/galleries/boi/images/rhel9_logstash/versions/1.0.0"
  hyper_v_generation         = "V2"
  location                   = "northeurope"
  name                       = "R-CSSPZ-VM-LGS-MAN-PRD-001_disk1_903c357f4614472e8b1a7daedf2f917e"
  os_type                    = "Linux"
  resource_group_name        = "r-csspz-rg-man-prd-007"
  storage_account_type       = "Standard_LRS"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
    PatchGroup                = "PLACEHOLDER"
    Project                   = "PLACEHOLDER"
    "Server Criticality"      = "PLACEHOLDER"
    ServerCriticality         = "PLACEHOLDER"
    StartStopSchedule         = "PLACEHOLDER"
    "Support Groups"          = "PLACEHOLDER"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_managed_disk" "res-60" {
  create_option              = "FromImage"
  gallery_image_reference_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/m-csspz-rg-man-prd-004/providers/Microsoft.Compute/galleries/boi/images/rhel9_logstash/versions/1.0.0"
  hyper_v_generation         = "V2"
  location                   = "northeurope"
  name                       = "R-CSSPZ-VM-LGS-MAN-PRD-002_disk1_a54de3524c834c8bbe8ba24b7d99b1bd"
  os_type                    = "Linux"
  resource_group_name        = "r-csspz-rg-man-prd-007"
  storage_account_type       = "Standard_LRS"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
    PatchGroup                = "PLACEHOLDER"
    Project                   = "PLACEHOLDER"
    "Server Criticality"      = "PLACEHOLDER"
    ServerCriticality         = "PLACEHOLDER"
    StartStopSchedule         = "PLACEHOLDER"
    "Support Groups"          = "PLACEHOLDER"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_managed_disk" "res-61" {
  create_option              = "FromImage"
  gallery_image_reference_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/m-csspz-rg-man-prd-004/providers/Microsoft.Compute/galleries/boi/images/rhel9_logstash/versions/1.0.0"
  hyper_v_generation         = "V2"
  location                   = "northeurope"
  name                       = "R-CSSPZ-VM-LGS-MAN-PRD-003_disk1_6cdc8820885046ea9c82f3012af74ded"
  os_type                    = "Linux"
  resource_group_name        = "r-csspz-rg-man-prd-007"
  storage_account_type       = "Standard_LRS"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
    PatchGroup                = "PLACEHOLDER"
    Project                   = "PLACEHOLDER"
    "Server Criticality"      = "PLACEHOLDER"
    ServerCriticality         = "PLACEHOLDER"
    StartStopSchedule         = "PLACEHOLDER"
    "Support Groups"          = "PLACEHOLDER"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_managed_disk" "res-62" {
  create_option              = "FromImage"
  gallery_image_reference_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/m-csspz-rg-man-prd-004/providers/Microsoft.Compute/galleries/boi/images/rhel9_logstash/versions/1.0.0"
  hyper_v_generation         = "V2"
  location                   = "northeurope"
  name                       = "R-CSSPZ-VM-LGS-MAN-PRD-005_disk1_ba6eb88c2b5d4db0876baf55058a8bb9"
  os_type                    = "Linux"
  resource_group_name        = "r-csspz-rg-man-prd-007"
  storage_account_type       = "Standard_LRS"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
    PatchGroup                = "PLACEHOLDER"
    Project                   = "PLACEHOLDER"
    "Server Criticality"      = "PLACEHOLDER"
    ServerCriticality         = "PLACEHOLDER"
    StartStopSchedule         = "PLACEHOLDER"
    "Support Groups"          = "PLACEHOLDER"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_managed_disk" "res-63" {
  create_option              = "FromImage"
  gallery_image_reference_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-004/providers/Microsoft.Compute/galleries/BoI/images/RHEL9_LOGSTASH/versions/1.0.0"
  hyper_v_generation         = "V2"
  location                   = "northeurope"
  name                       = "R-CSSPZ-VM-LGS-MAN-PRD-007_OsDisk_1_8eeeaf8c8c5d47d5a9e99edef5afbbff"
  os_type                    = "Linux"
  resource_group_name        = "r-csspz-rg-man-prd-007"
  storage_account_type       = "Standard_LRS"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
    PatchGroup                = "PLACEHOLDER"
    Project                   = "PLACEHOLDER"
    "Server Criticality"      = "PLACEHOLDER"
    ServerCriticality         = "PLACEHOLDER"
    StartStopSchedule         = "PLACEHOLDER"
    "Support Groups"          = "PLACEHOLDER"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_managed_disk" "res-64" {
  create_option              = "FromImage"
  gallery_image_reference_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-004/providers/Microsoft.Compute/galleries/BoI/images/RHEL9_LOGSTASH/versions/1.0.0"
  hyper_v_generation         = "V2"
  location                   = "northeurope"
  name                       = "R-CSSPZ-VM-LGS-MAN-PRD-009_OsDisk_1_e42ec9a3ba92414884efbebadc514199"
  os_type                    = "Linux"
  resource_group_name        = "r-csspz-rg-man-prd-007"
  storage_account_type       = "Standard_LRS"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
    PatchGroup                = "PLACEHOLDER"
    Project                   = "PLACEHOLDER"
    "Server Criticality"      = "PLACEHOLDER"
    ServerCriticality         = "PLACEHOLDER"
    StartStopSchedule         = "PLACEHOLDER"
    "Support Groups"          = "PLACEHOLDER"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_managed_disk" "res-65" {
  create_option        = "Import"
  hyper_v_generation   = "V2"
  location             = "northeurope"
  name                 = "rcsspzvmlgsmanprd001-osdisk-20240530-104731"
  os_type              = "Linux"
  resource_group_name  = "r-csspz-rg-man-prd-007"
  storage_account_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/cloud-shell-storage-northeurope/providers/Microsoft.Storage/storageAccounts/csa1003200216883329"
  storage_account_type = "Standard_LRS"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
    PatchGroup                = "PLACEHOLDER"
    Project                   = "PLACEHOLDER"
    RSVaultBackup             = "b75dbd74-d4b1-4967-9f6c-b6876aba7a15"
    "Server Criticality"      = "PLACEHOLDER"
    ServerCriticality         = "PLACEHOLDER"
    StartStopSchedule         = "PLACEHOLDER"
    "Support Groups"          = "PLACEHOLDER"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_managed_disk" "res-66" {
  create_option        = "Import"
  hyper_v_generation   = "V2"
  location             = "northeurope"
  name                 = "rcsspzvmlgsmanprd002-osdisk-20240530-114836"
  os_type              = "Linux"
  resource_group_name  = "r-csspz-rg-man-prd-007"
  storage_account_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/cloud-shell-storage-northeurope/providers/Microsoft.Storage/storageAccounts/csa1003200216883329"
  storage_account_type = "Standard_LRS"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
    PatchGroup                = "PLACEHOLDER"
    Project                   = "PLACEHOLDER"
    RSVaultBackup             = "bee20ec6-5ed6-40aa-ba2a-cbdb1e0c2521"
    "Server Criticality"      = "PLACEHOLDER"
    ServerCriticality         = "PLACEHOLDER"
    StartStopSchedule         = "PLACEHOLDER"
    "Support Groups"          = "PLACEHOLDER"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_managed_disk" "res-67" {
  create_option        = "Import"
  hyper_v_generation   = "V2"
  location             = "northeurope"
  name                 = "rcsspzvmlgsmanprd003-osdisk-20240530-115016"
  os_type              = "Linux"
  resource_group_name  = "r-csspz-rg-man-prd-007"
  storage_account_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/cloud-shell-storage-northeurope/providers/Microsoft.Storage/storageAccounts/csa1003200216883329"
  storage_account_type = "Standard_LRS"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
    PatchGroup                = "PLACEHOLDER"
    Project                   = "PLACEHOLDER"
    RSVaultBackup             = "1459f095-0987-4329-93b7-de7793d87bbf"
    "Server Criticality"      = "PLACEHOLDER"
    ServerCriticality         = "PLACEHOLDER"
    StartStopSchedule         = "PLACEHOLDER"
    "Support Groups"          = "PLACEHOLDER"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_managed_disk" "res-68" {
  create_option        = "Restore"
  hyper_v_generation   = "V2"
  location             = "northeurope"
  name                 = "rcsspzvmlgsmanprd003-osdisk-20260212-091602"
  os_type              = "Linux"
  resource_group_name  = "r-csspz-rg-man-prd-007"
  source_resource_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/AzureBackupRG_northeurope_1/providers/Microsoft.Compute/restorePointCollections/AzureBackup_R-CSSPZ-VM-LGS-MAN-PRD-003_1599217673268902991/restorePoints/AzureBackup_20260210_113605/disks/rcsspzvmlgsmanprd003-osdisk-20240530-115016?id=c4ceea78-337c-493b-b332-de74a53de230"
  storage_account_type = "Standard_LRS"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
    PatchGroup                = "PLACEHOLDER"
    Project                   = "PLACEHOLDER"
    RSVaultBackup             = "6665b2fa-9d30-4378-9136-f5ebf794f69e"
    "Server Criticality"      = "PLACEHOLDER"
    ServerCriticality         = "PLACEHOLDER"
    StartStopSchedule         = "PLACEHOLDER"
    "Support Groups"          = "PLACEHOLDER"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_managed_disk" "res-69" {
  create_option        = "Restore"
  hyper_v_generation   = "V2"
  location             = "northeurope"
  name                 = "rcsspzvmlgsmanprd005-osdisk-20260212-101143"
  os_type              = "Linux"
  resource_group_name  = "r-csspz-rg-man-prd-007"
  source_resource_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/AzureBackupRG_northeurope_1/providers/Microsoft.Compute/restorePointCollections/AzureBackup_R-CSSPZ-VM-LGS-MAN-PRD-005_1599217672409507627/restorePoints/AzureBackup_20260210_113757/disks/R-CSSPZ-VM-LGS-MAN-PRD-005_disk1_ba6eb88c2b5d4db0876baf55058a8bb9?id=15015b84-40ea-45c2-81ea-b727378fb961"
  storage_account_type = "Standard_LRS"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
    PatchGroup                = "PLACEHOLDER"
    Project                   = "PLACEHOLDER"
    RSVaultBackup             = "836cc43a-616d-4cb5-9b4f-ddc16da5de61"
    "Server Criticality"      = "PLACEHOLDER"
    ServerCriticality         = "PLACEHOLDER"
    StartStopSchedule         = "PLACEHOLDER"
    "Support Groups"          = "PLACEHOLDER"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_managed_disk" "res-70" {
  create_option        = "Import"
  hyper_v_generation   = "V2"
  location             = "northeurope"
  name                 = "rcsspzvmlgsmanprd009-osdisk-20241217-074350"
  os_type              = "Linux"
  resource_group_name  = "r-csspz-rg-man-prd-007"
  storage_account_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-004/providers/Microsoft.Storage/storageAccounts/mcsspzsamanprd002"
  storage_account_type = "Standard_LRS"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
    PatchGroup                = "PLACEHOLDER"
    Project                   = "PLACEHOLDER"
    RSVaultBackup             = "7d96338d-10fb-4e79-9fe2-baec282d9453"
    "Server Criticality"      = "PLACEHOLDER"
    ServerCriticality         = "PLACEHOLDER"
    StartStopSchedule         = "PLACEHOLDER"
    "Support Groups"          = "PLACEHOLDER"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_managed_disk" "res-71" {
  create_option        = "Import"
  hyper_v_generation   = "V2"
  location             = "northeurope"
  name                 = "rcsspzvmlgsmanprd009-osdisk-20241217-094657"
  os_type              = "Linux"
  resource_group_name  = "r-csspz-rg-man-prd-007"
  storage_account_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-004/providers/Microsoft.Storage/storageAccounts/mcsspzsamanprd002"
  storage_account_type = "Standard_LRS"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
    PatchGroup                = "PLACEHOLDER"
    Project                   = "PLACEHOLDER"
    RSVaultBackup             = "8862465e-bcd3-4eb7-a2aa-705f37170f84"
    "Server Criticality"      = "PLACEHOLDER"
    ServerCriticality         = "PLACEHOLDER"
    StartStopSchedule         = "PLACEHOLDER"
    "Support Groups"          = "PLACEHOLDER"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_snapshot" "res-72" {
  create_option       = "Copy"
  location            = "northeurope"
  name                = "R-CSSPZ-VM-LGS-MAN-PRD-005-snapshot"
  resource_group_name = "r-csspz-rg-man-prd-007"
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
    "Cost Centre"             = "FD2000"
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_snapshot" "res-73" {
  create_option       = "Copy"
  location            = "northeurope"
  name                = "RZCSYSLGMANPRD01_RHEL7_2024_04_10_beforeMigration"
  resource_group_name = "r-csspz-rg-man-prd-007"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_snapshot" "res-74" {
  create_option       = "Copy"
  location            = "northeurope"
  name                = "RZCSYSLGMANPRD02_RHEL7_2024_04_10_beforeMigration"
  resource_group_name = "r-csspz-rg-man-prd-007"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_snapshot" "res-75" {
  create_option       = "Copy"
  location            = "northeurope"
  name                = "RZCSYSLGMANPRD03_RHEL7_2024_04_09_beforeMigration"
  resource_group_name = "r-csspz-rg-man-prd-007"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_snapshot" "res-76" {
  create_option       = "Copy"
  location            = "northeurope"
  name                = "RZCSYSLGMANPRD04_RHEL7_2024_04_09_beforeMigration"
  resource_group_name = "r-csspz-rg-man-prd-007"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_snapshot" "res-77" {
  create_option       = "Copy"
  location            = "northeurope"
  name                = "RZCSYSLGMANPRD05_RHEL7_2024_04_09_beforeMigration"
  resource_group_name = "r-csspz-rg-man-prd-007"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_snapshot" "res-78" {
  create_option       = "Copy"
  location            = "northeurope"
  name                = "RZCSYSLGMANPRD06_RHEL7_2024_04_08_beforeMigration"
  resource_group_name = "r-csspz-rg-man-prd-007"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_snapshot" "res-79" {
  create_option       = "Copy"
  location            = "northeurope"
  name                = "RZCSYSLGMANPRD07_RHEL7_2024_04_08_beforeMigration"
  resource_group_name = "r-csspz-rg-man-prd-007"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_snapshot" "res-80" {
  create_option       = "Copy"
  location            = "northeurope"
  name                = "RZCSYSLGMANPRD08_RHEL7_2024_04_08_beforeMigration"
  resource_group_name = "r-csspz-rg-man-prd-007"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_snapshot" "res-81" {
  create_option                 = "Copy"
  location                      = "northeurope"
  name                          = "RZCSYSLGMANPRD09_RHEL7_2024_04_03_beforeMigration"
  network_access_policy         = "DenyAll"
  public_network_access_enabled = false
  resource_group_name           = "r-csspz-rg-man-prd-007"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_snapshot" "res-82" {
  create_option                 = "Copy"
  location                      = "northeurope"
  name                          = "RZCSYSLGMANPRD10_RHEL7_2024_04_03_beforeMigration"
  network_access_policy         = "DenyAll"
  public_network_access_enabled = false
  resource_group_name           = "r-csspz-rg-man-prd-007"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_snapshot" "res-83" {
  create_option                 = "Copy"
  location                      = "northeurope"
  name                          = "RZCSYSLGMANPRD11_RHEL7_2024_04_03_beforeMigration"
  network_access_policy         = "DenyAll"
  public_network_access_enabled = false
  resource_group_name           = "r-csspz-rg-man-prd-007"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_snapshot" "res-84" {
  create_option       = "Copy"
  location            = "northeurope"
  name                = "RZCSYSLGMANPRD11_RHEL7_2024_04_10_beforeMigration"
  resource_group_name = "r-csspz-rg-man-prd-007"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_snapshot" "res-85" {
  create_option       = "Copy"
  location            = "northeurope"
  name                = "RZCSYSLGMANPRD12_RHEL7_2024_04_03_beforeMigration"
  resource_group_name = "r-csspz-rg-man-prd-007"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_snapshot" "res-86" {
  create_option       = "Copy"
  location            = "northeurope"
  name                = "RZCSYSLGMANPRD12_RHEL7_2024_04_10_beforeMigration"
  resource_group_name = "r-csspz-rg-man-prd-007"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_linux_virtual_machine" "res-87" {
  admin_password                  = "ignored-as-imported"
  admin_username                  = "admin-1"
  disable_password_authentication = false
  location                        = "northeurope"
  name                            = "R-CSSPZ-VM-LGS-MAN-PRD-001"
  network_interface_ids           = ["/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/networkInterfaces/R-CSSPZ-VM-LGS-MAN-PRD-001-NIC"]
  resource_group_name             = "r-csspz-rg-man-prd-007"
  size                            = "Standard_D4s_v3"
  source_image_id                 = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-004/providers/Microsoft.Compute/galleries/BoI/images/RHEL9_LOGSTASH/versions/1.0.0"
  tags = {
    "Account Type"            = "CCoE Managed"
    "App Support"             = "PLACEHOLDER"
    AppSupport                = "PLACEHOLDER"
    "BOI Application"         = "PLACEHOLDER"
    "BOI Application Service" = "PLACEHOLDER"
    Backup                    = "Azure Backup"
    "Business Function"       = "This is a SIEM Log collector server"
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
    "Operational Status"      = "Live"
    "Owned By"                = "CCoE"
    Owner                     = "Daniel Dalla"
    PII                       = "PLACEHOLDER"
    "Patch Group"             = "PLACEHOLDER"
    PatchGroup                = "PLACEHOLDER"
    Project                   = "PLACEHOLDER"
    "Server Criticality"      = "PLACEHOLDER"
    ServerCriticality         = "PLACEHOLDER"
    StartStopSchedule         = "PLACEHOLDER"
    "Support Group"           = "HCL-VIP-Support"
    "Support Groups"          = "PLACEHOLDER"
  }
  boot_diagnostics {
  }
  identity {
    type = "SystemAssigned"
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  plan {
    name      = "cis-redhat9-l1-gen2"
    product   = "cis-rhel"
    publisher = "center-for-internet-security-inc"
  }
  depends_on = [
    azurerm_network_interface.res-33,
  ]
}
resource "azurerm_virtual_machine_extension" "res-88" {
  auto_upgrade_minor_version = true
  name                       = "enablevmAccess"
  publisher                  = "Microsoft.OSTCExtensions"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "VMAccessForLinux"
  type_handler_version = "1.5"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-001"
  depends_on = [
    azurerm_linux_virtual_machine.res-87,
  ]
}
resource "azurerm_linux_virtual_machine" "res-89" {
  admin_password                  = "ignored-as-imported"
  admin_username                  = "admin-1"
  disable_password_authentication = false
  location                        = "northeurope"
  name                            = "R-CSSPZ-VM-LGS-MAN-PRD-002"
  network_interface_ids           = ["/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/networkInterfaces/R-CSSPZ-VM-LGS-MAN-PRD-002-NIC"]
  resource_group_name             = "r-csspz-rg-man-prd-007"
  size                            = "Standard_D4s_v3"
  source_image_id                 = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-004/providers/Microsoft.Compute/galleries/BoI/images/RHEL9_LOGSTASH/versions/1.0.0"
  tags = {
    "Account Type"            = "CCoE Managed"
    "App Support"             = "PLACEHOLDER"
    AppSupport                = "PLACEHOLDER"
    "BOI Application"         = "PLACEHOLDER"
    "BOI Application Service" = "PLACEHOLDER"
    Backup                    = "PLACEHOLDER"
    "Business Function"       = "This is a SIEM Log collector server"
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
    PatchGroup                = "PLACEHOLDER"
    Project                   = "PLACEHOLDER"
    "Server Criticality"      = "PLACEHOLDER"
    ServerCriticality         = "PLACEHOLDER"
    StartStopSchedule         = "PLACEHOLDER"
    "Support Group"           = "HCL-VIP-Support"
    "Support Groups"          = "PLACEHOLDER"
  }
  boot_diagnostics {
  }
  identity {
    type = "SystemAssigned"
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  plan {
    name      = "cis-redhat9-l1-gen2"
    product   = "cis-rhel"
    publisher = "center-for-internet-security-inc"
  }
  depends_on = [
    azurerm_network_interface.res-35,
  ]
}
resource "azurerm_virtual_machine_extension" "res-90" {
  auto_upgrade_minor_version = true
  name                       = "enablevmAccess"
  publisher                  = "Microsoft.OSTCExtensions"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "VMAccessForLinux"
  type_handler_version = "1.5"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-002"
  depends_on = [
    azurerm_linux_virtual_machine.res-89,
  ]
}
resource "azurerm_linux_virtual_machine" "res-91" {
  admin_password                  = "ignored-as-imported"
  admin_username                  = "admin-1"
  disable_password_authentication = false
  location                        = "northeurope"
  name                            = "R-CSSPZ-VM-LGS-MAN-PRD-003"
  network_interface_ids           = ["/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/networkInterfaces/R-CSSPZ-VM-LGS-MAN-PRD-003-NIC"]
  resource_group_name             = "r-csspz-rg-man-prd-007"
  size                            = "Standard_D4s_v3"
  source_image_id                 = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-004/providers/Microsoft.Compute/galleries/BoI/images/RHEL9_LOGSTASH/versions/1.0.0"
  tags = {
    "Account Type"            = "CCoE Managed"
    "App Support"             = "PLACEHOLDER"
    AppSupport                = "PLACEHOLDER"
    "BOI Application"         = "PLACEHOLDER"
    "BOI Application Service" = "PLACEHOLDER"
    Backup                    = "PLACEHOLDER"
    "Business Function"       = "This is a SIEM Log collector server"
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
    PatchGroup                = "PLACEHOLDER"
    Project                   = "PLACEHOLDER"
    "Server Criticality"      = "PLACEHOLDER"
    ServerCriticality         = "PLACEHOLDER"
    StartStopSchedule         = "PLACEHOLDER"
    "Support Group"           = "HCL-VIP-Support"
    "Support Groups"          = "PLACEHOLDER"
  }
  boot_diagnostics {
  }
  identity {
    type = "SystemAssigned"
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  plan {
    name      = "cis-redhat9-l1-gen2"
    product   = "cis-rhel"
    publisher = "center-for-internet-security-inc"
  }
  depends_on = [
    azurerm_network_interface.res-37,
  ]
}
resource "azurerm_virtual_machine_extension" "res-92" {
  auto_upgrade_minor_version = true
  name                       = "enablevmAccess"
  publisher                  = "Microsoft.OSTCExtensions"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "VMAccessForLinux"
  type_handler_version = "1.5"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-003"
  depends_on = [
    azurerm_linux_virtual_machine.res-91,
  ]
}
resource "azurerm_linux_virtual_machine" "res-93" {
  admin_password                  = "ignored-as-imported"
  admin_username                  = "admin-1"
  disable_password_authentication = false
  location                        = "northeurope"
  name                            = "R-CSSPZ-VM-LGS-MAN-PRD-004"
  network_interface_ids           = ["/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/networkInterfaces/R-CSSPZ-VM-LGS-MAN-PRD-004-NIC"]
  resource_group_name             = "r-csspz-rg-man-prd-007"
  size                            = "Standard_D4s_v3"
  source_image_id                 = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-004/providers/Microsoft.Compute/galleries/BoI/images/RHEL9_LOGSTASH/versions/1.0.0"
  tags = {
    "Account Type"            = "CCoE Managed"
    "App Support"             = "PLACEHOLDER"
    AppSupport                = "PLACEHOLDER"
    "BOI Application"         = "PLACEHOLDER"
    "BOI Application Service" = "PLACEHOLDER"
    Backup                    = "PLACEHOLDER"
    "Business Function"       = "This is a SIEM Log collector server"
    "Business Unit"           = "PLACEHOLDER"
    BusinessFunction          = "This is a SIEM Log collector server"
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
    PatchGroup                = "PLACEHOLDER"
    Project                   = "PLACEHOLDER"
    "Server Criticality"      = "PLACEHOLDER"
    ServerCriticality         = "PLACEHOLDER"
    StartStopSchedule         = "PLACEHOLDER"
    "Support Group"           = "HCL-VIP-Support"
    "Support Groups"          = "PLACEHOLDER"
  }
  boot_diagnostics {
  }
  identity {
    type = "SystemAssigned"
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  plan {
    name      = "cis-redhat9-l1-gen2"
    product   = "cis-rhel"
    publisher = "center-for-internet-security-inc"
  }
  depends_on = [
    azurerm_network_interface.res-39,
  ]
}
resource "azurerm_virtual_machine_extension" "res-94" {
  auto_upgrade_minor_version = true
  name                       = "enablevmAccess"
  publisher                  = "Microsoft.OSTCExtensions"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "VMAccessForLinux"
  type_handler_version = "1.5"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-004"
  depends_on = [
    azurerm_linux_virtual_machine.res-93,
  ]
}
resource "azurerm_linux_virtual_machine" "res-95" {
  admin_password                  = "ignored-as-imported"
  admin_username                  = "admin-1"
  disable_password_authentication = false
  location                        = "northeurope"
  name                            = "R-CSSPZ-VM-LGS-MAN-PRD-005"
  network_interface_ids           = ["/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/networkInterfaces/R-CSSPZ-VM-LGS-MAN-PRD-005-NIC"]
  resource_group_name             = "r-csspz-rg-man-prd-007"
  size                            = "Standard_D4s_v3"
  source_image_id                 = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-004/providers/Microsoft.Compute/galleries/BoI/images/RHEL9_LOGSTASH/versions/1.0.0"
  tags = {
    "Account Type"            = "CCoE Managed"
    "App Support"             = "PLACEHOLDER"
    AppSupport                = "PLACEHOLDER"
    "BOI Application"         = "PLACEHOLDER"
    "BOI Application Service" = "PLACEHOLDER"
    Backup                    = "PLACEHOLDER"
    "Business Function"       = "This is a SIEM Log collector server"
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
    PatchGroup                = "PLACEHOLDER"
    Project                   = "PLACEHOLDER"
    "Server Criticality"      = "PLACEHOLDER"
    ServerCriticality         = "PLACEHOLDER"
    StartStopSchedule         = "PLACEHOLDER"
    "Support Group"           = "HCL-VIP-Support"
    "Support Groups"          = "PLACEHOLDER"
  }
  boot_diagnostics {
  }
  identity {
    type = "SystemAssigned"
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  plan {
    name      = "cis-redhat9-l1-gen2"
    product   = "cis-rhel"
    publisher = "center-for-internet-security-inc"
  }
  depends_on = [
    azurerm_network_interface.res-41,
  ]
}
resource "azurerm_virtual_machine_extension" "res-96" {
  auto_upgrade_minor_version = true
  name                       = "enablevmAccess"
  publisher                  = "Microsoft.OSTCExtensions"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "VMAccessForLinux"
  type_handler_version = "1.5"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-005"
  depends_on = [
    azurerm_linux_virtual_machine.res-95,
  ]
}
resource "azurerm_linux_virtual_machine" "res-97" {
  admin_password                  = "ignored-as-imported"
  admin_username                  = "admin-1"
  disable_password_authentication = false
  location                        = "northeurope"
  name                            = "R-CSSPZ-VM-LGS-MAN-PRD-006"
  network_interface_ids           = ["/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/networkInterfaces/R-CSSPZ-VM-LGS-MAN-PRD-006-NIC"]
  resource_group_name             = "r-csspz-rg-man-prd-007"
  size                            = "Standard_D4s_v3"
  source_image_id                 = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-004/providers/Microsoft.Compute/galleries/BoI/images/RHEL9_LOGSTASH/versions/1.0.0"
  tags = {
    "Account Type"            = "CCoE Managed"
    "App Support"             = "PLACEHOLDER"
    AppSupport                = "PLACEHOLDER"
    "BOI Application"         = "PLACEHOLDER"
    "BOI Application Service" = "PLACEHOLDER"
    Backup                    = "PLACEHOLDER"
    "Business Function"       = "This is a SIEM Log collector server"
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
    PatchGroup                = "PLACEHOLDER"
    Project                   = "PLACEHOLDER"
    "Server Criticality"      = "PLACEHOLDER"
    ServerCriticality         = "PLACEHOLDER"
    StartStopSchedule         = "PLACEHOLDER"
    "Support Group"           = "HCL-VIP-Support"
    "Support Groups"          = "PLACEHOLDER"
  }
  boot_diagnostics {
  }
  identity {
    type = "SystemAssigned"
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  plan {
    name      = "cis-redhat9-l1-gen2"
    product   = "cis-rhel"
    publisher = "center-for-internet-security-inc"
  }
  depends_on = [
    azurerm_network_interface.res-43,
  ]
}
resource "azurerm_virtual_machine_extension" "res-98" {
  auto_upgrade_minor_version = true
  name                       = "enablevmAccess"
  publisher                  = "Microsoft.OSTCExtensions"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "VMAccessForLinux"
  type_handler_version = "1.5"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-006"
  depends_on = [
    azurerm_linux_virtual_machine.res-97,
  ]
}
resource "azurerm_linux_virtual_machine" "res-99" {
  admin_password                  = "ignored-as-imported"
  admin_username                  = "admin-1"
  disable_password_authentication = false
  location                        = "northeurope"
  name                            = "R-CSSPZ-VM-LGS-MAN-PRD-007"
  network_interface_ids           = ["/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/networkInterfaces/R-CSSPZ-VM-LGS-MAN-PRD-007-NIC"]
  resource_group_name             = "r-csspz-rg-man-prd-007"
  size                            = "Standard_D4s_v3"
  source_image_id                 = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-004/providers/Microsoft.Compute/galleries/BoI/images/RHEL9_LOGSTASH/versions/1.0.0"
  tags = {
    "Account Type"            = "CCoE Managed"
    "App Support"             = "PLACEHOLDER"
    AppSupport                = "PLACEHOLDER"
    "BOI Application"         = "PLACEHOLDER"
    "BOI Application Service" = "PLACEHOLDER"
    Backup                    = "PLACEHOLDER"
    "Business Function"       = "This is a SIEM Log collector server"
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
    PatchGroup                = "PLACEHOLDER"
    Project                   = "PLACEHOLDER"
    "Server Criticality"      = "PLACEHOLDER"
    ServerCriticality         = "PLACEHOLDER"
    StartStopSchedule         = "PLACEHOLDER"
    "Support Group"           = "HCL-VIP-Support"
    "Support Groups"          = "PLACEHOLDER"
  }
  boot_diagnostics {
  }
  identity {
    type = "SystemAssigned"
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  plan {
    name      = "cis-redhat9-l1-gen2"
    product   = "cis-rhel"
    publisher = "center-for-internet-security-inc"
  }
  depends_on = [
    azurerm_network_interface.res-45,
  ]
}
resource "azurerm_virtual_machine_extension" "res-100" {
  auto_upgrade_minor_version = true
  name                       = "enablevmAccess"
  publisher                  = "Microsoft.OSTCExtensions"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "VMAccessForLinux"
  type_handler_version = "1.5"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-007"
  depends_on = [
    azurerm_linux_virtual_machine.res-99,
  ]
}
resource "azurerm_linux_virtual_machine" "res-101" {
  admin_password                  = "ignored-as-imported"
  admin_username                  = "admin-1"
  disable_password_authentication = false
  location                        = "northeurope"
  name                            = "R-CSSPZ-VM-LGS-MAN-PRD-008"
  network_interface_ids           = ["/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/networkInterfaces/R-CSSPZ-VM-LGS-MAN-PRD-008-NIC"]
  resource_group_name             = "r-csspz-rg-man-prd-007"
  size                            = "Standard_D4s_v3"
  source_image_id                 = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-004/providers/Microsoft.Compute/galleries/BoI/images/RHEL9_LOGSTASH/versions/1.0.0"
  tags = {
    "Account Type"            = "CCoE Managed"
    "App Support"             = "PLACEHOLDER"
    AppSupport                = "PLACEHOLDER"
    "BOI Application"         = "PLACEHOLDER"
    "BOI Application Service" = "PLACEHOLDER"
    Backup                    = "PLACEHOLDER"
    "Business Function"       = "This is a SIEM Log collector server"
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
    PatchGroup                = "PLACEHOLDER"
    Project                   = "PLACEHOLDER"
    "Server Criticality"      = "PLACEHOLDER"
    ServerCriticality         = "PLACEHOLDER"
    StartStopSchedule         = "PLACEHOLDER"
    "Support Group"           = "HCL-VIP-Support"
    "Support Groups"          = "PLACEHOLDER"
  }
  boot_diagnostics {
  }
  identity {
    type = "SystemAssigned"
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  plan {
    name      = "cis-redhat9-l1-gen2"
    product   = "cis-rhel"
    publisher = "center-for-internet-security-inc"
  }
  depends_on = [
    azurerm_network_interface.res-47,
  ]
}
resource "azurerm_virtual_machine_extension" "res-102" {
  auto_upgrade_minor_version = true
  name                       = "enablevmAccess"
  publisher                  = "Microsoft.OSTCExtensions"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "VMAccessForLinux"
  type_handler_version = "1.5"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-008"
  depends_on = [
    azurerm_linux_virtual_machine.res-101,
  ]
}
resource "azurerm_linux_virtual_machine" "res-103" {
  admin_password                  = "ignored-as-imported"
  admin_username                  = "admin-1"
  disable_password_authentication = false
  location                        = "northeurope"
  name                            = "R-CSSPZ-VM-LGS-MAN-PRD-009"
  network_interface_ids           = ["/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/networkInterfaces/R-CSSPZ-VM-LGS-MAN-PRD-009-NIC"]
  resource_group_name             = "r-csspz-rg-man-prd-007"
  size                            = "Standard_D4s_v3"
  source_image_id                 = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-004/providers/Microsoft.Compute/galleries/BoI/images/RHEL9_LOGSTASH/versions/1.0.0"
  tags = {
    "Account Type"            = "CCoE Managed"
    "App Support"             = "PLACEHOLDER"
    AppSupport                = "PLACEHOLDER"
    "BOI Application"         = "PLACEHOLDER"
    "BOI Application Service" = "PLACEHOLDER"
    Backup                    = "Azure Backup"
    "Business Function"       = "This is a SIEM Log collector server"
    "Business Unit"           = "PLACEHOLDER"
    BusinessUnit              = "PLACEHOLDER"
    Compliance                = "PLACEHOLDER"
    Confidentiality           = "PLACEHOLDER"
    "Cost Centre"             = "PLACEHOLDER"
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
    PatchGroup                = "PLACEHOLDER"
    Project                   = "PLACEHOLDER"
    "Server Criticality"      = "PLACEHOLDER"
    ServerCriticality         = "PLACEHOLDER"
    StartStopSchedule         = "PLACEHOLDER"
    "Support Groups"          = "PLACEHOLDER"
  }
  boot_diagnostics {
  }
  identity {
    type = "SystemAssigned"
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  plan {
    name      = "cis-redhat9-l1-gen2"
    product   = "cis-rhel"
    publisher = "center-for-internet-security-inc"
  }
  depends_on = [
    azurerm_network_interface.res-49,
  ]
}
resource "azurerm_virtual_machine_extension" "res-104" {
  auto_upgrade_minor_version = true
  name                       = "AzureMonitorLinuxAgent"
  publisher                  = "Microsoft.Azure.Monitor"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "AzureMonitorLinuxAgent"
  type_handler_version = "1.35"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-009"
  depends_on = [
    azurerm_linux_virtual_machine.res-103,
  ]
}
resource "azurerm_virtual_machine_extension" "res-105" {
  auto_upgrade_minor_version = true
  name                       = "enablevmAccess"
  publisher                  = "Microsoft.OSTCExtensions"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "VMAccessForLinux"
  type_handler_version = "1.5"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-009"
  depends_on = [
    azurerm_linux_virtual_machine.res-103,
  ]
}
resource "azurerm_linux_virtual_machine" "res-106" {
  admin_password                  = "ignored-as-imported"
  admin_username                  = "admin-1"
  disable_password_authentication = false
  location                        = "northeurope"
  name                            = "R-CSSPZ-VM-LGS-MAN-PRD-010"
  network_interface_ids           = ["/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/networkInterfaces/R-CSSPZ-VM-LGS-MAN-PRD-010-NIC"]
  resource_group_name             = "r-csspz-rg-man-prd-007"
  size                            = "Standard_D4s_v3"
  source_image_id                 = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-004/providers/Microsoft.Compute/galleries/BoI/images/RHEL9_LOGSTASH/versions/1.0.0"
  tags = {
    "Account Type"            = "CCoE Managed"
    "App Support"             = "PLACEHOLDER"
    AppSupport                = "PLACEHOLDER"
    "BOI Application"         = "PLACEHOLDER"
    "BOI Application Service" = "PLACEHOLDER"
    Backup                    = "PLACEHOLDER"
    "Business Function"       = "This is a SIEM Log collector server"
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
    PatchGroup                = "PLACEHOLDER"
    Project                   = "PLACEHOLDER"
    "Server Criticality"      = "PLACEHOLDER"
    ServerCriticality         = "PLACEHOLDER"
    StartStopSchedule         = "PLACEHOLDER"
    "Support Group"           = "HCL-VIP-Support"
    "Support Groups"          = "PLACEHOLDER"
  }
  boot_diagnostics {
  }
  identity {
    type = "SystemAssigned"
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  plan {
    name      = "cis-redhat9-l1-gen2"
    product   = "cis-rhel"
    publisher = "center-for-internet-security-inc"
  }
  depends_on = [
    azurerm_network_interface.res-51,
  ]
}
resource "azurerm_virtual_machine_extension" "res-107" {
  auto_upgrade_minor_version = true
  name                       = "enablevmAccess"
  publisher                  = "Microsoft.OSTCExtensions"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "VMAccessForLinux"
  type_handler_version = "1.5"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-010"
  depends_on = [
    azurerm_linux_virtual_machine.res-106,
  ]
}
resource "azurerm_linux_virtual_machine" "res-108" {
  admin_password                  = "ignored-as-imported"
  admin_username                  = "admin-1"
  disable_password_authentication = false
  location                        = "northeurope"
  name                            = "R-CSSPZ-VM-LGS-MAN-PRD-011"
  network_interface_ids           = ["/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/networkInterfaces/R-CSSPZ-VM-LGS-MAN-PRD-011-NIC"]
  resource_group_name             = "r-csspz-rg-man-prd-007"
  size                            = "Standard_D4s_v3"
  source_image_id                 = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-004/providers/Microsoft.Compute/galleries/BoI/images/RHEL9_LOGSTASH/versions/1.0.0"
  tags = {
    "Account Type"            = "CCoE Managed"
    "App Support"             = "PLACEHOLDER"
    AppSupport                = "PLACEHOLDER"
    "BOI Application"         = "PLACEHOLDER"
    "BOI Application Service" = "PLACEHOLDER"
    Backup                    = "PLACEHOLDER"
    "Business Function"       = "This is a SIEM Log collector server"
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
    PatchGroup                = "PLACEHOLDER"
    Project                   = "PLACEHOLDER"
    "Server Criticality"      = "PLACEHOLDER"
    ServerCriticality         = "PLACEHOLDER"
    StartStopSchedule         = "PLACEHOLDER"
    "Support Group"           = "HCL-VIP-Support"
    "Support Groups"          = "PLACEHOLDER"
  }
  boot_diagnostics {
  }
  identity {
    type = "SystemAssigned"
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  plan {
    name      = "cis-redhat9-l1-gen2"
    product   = "cis-rhel"
    publisher = "center-for-internet-security-inc"
  }
  depends_on = [
    azurerm_network_interface.res-53,
  ]
}
resource "azurerm_virtual_machine_extension" "res-109" {
  auto_upgrade_minor_version = true
  name                       = "AzureNetworkWatcherExtension"
  publisher                  = "Microsoft.Azure.NetworkWatcher"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "NetworkWatcherAgentLinux"
  type_handler_version = "1.4"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-011"
  depends_on = [
    azurerm_linux_virtual_machine.res-108,
  ]
}
resource "azurerm_virtual_machine_extension" "res-110" {
  auto_upgrade_minor_version = true
  name                       = "enablevmAccess"
  publisher                  = "Microsoft.OSTCExtensions"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "VMAccessForLinux"
  type_handler_version = "1.5"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-011"
  depends_on = [
    azurerm_linux_virtual_machine.res-108,
  ]
}
resource "azurerm_linux_virtual_machine" "res-111" {
  admin_password                  = "ignored-as-imported"
  admin_username                  = "admin-1"
  disable_password_authentication = false
  location                        = "northeurope"
  name                            = "R-CSSPZ-VM-LGS-MAN-PRD-012"
  network_interface_ids           = ["/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-007/providers/Microsoft.Network/networkInterfaces/R-CSSPZ-VM-LGS-MAN-PRD-012-NIC"]
  resource_group_name             = "r-csspz-rg-man-prd-007"
  size                            = "Standard_D4s_v3"
  source_image_id                 = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-004/providers/Microsoft.Compute/galleries/BoI/images/RHEL9_LOGSTASH/versions/1.0.0"
  tags = {
    "Account Type"            = "CCoE Managed"
    "App Support"             = "PLACEHOLDER"
    AppSupport                = "PLACEHOLDER"
    "BOI Application"         = "PLACEHOLDER"
    "BOI Application Service" = "PLACEHOLDER"
    Backup                    = "PLACEHOLDER"
    "Business Function"       = "This is a SIEM Log collector server"
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
    PatchGroup                = "PLACEHOLDER"
    Project                   = "PLACEHOLDER"
    "Server Criticality"      = "PLACEHOLDER"
    ServerCriticality         = "PLACEHOLDER"
    StartStopSchedule         = "PLACEHOLDER"
    "Support Group"           = "HCL-VIP-Support"
    "Support Groups"          = "PLACEHOLDER"
  }
  boot_diagnostics {
  }
  identity {
    type = "SystemAssigned"
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  plan {
    name      = "cis-redhat9-l1-gen2"
    product   = "cis-rhel"
    publisher = "center-for-internet-security-inc"
  }
  depends_on = [
    azurerm_network_interface.res-55,
  ]
}
resource "azurerm_virtual_machine_extension" "res-112" {
  auto_upgrade_minor_version = true
  name                       = "enablevmAccess"
  publisher                  = "Microsoft.OSTCExtensions"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "VMAccessForLinux"
  type_handler_version = "1.5"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-012"
  depends_on = [
    azurerm_linux_virtual_machine.res-111,
  ]
}
resource "azurerm_virtual_machine_extension" "res-113" {
  auto_upgrade_minor_version = true
  name                       = "OmsAgentForLinux"
  publisher                  = "Microsoft.EnterpriseCloud.Monitoring"
  settings = jsonencode({
    azureResourceId           = null
    stopOnMultipleConnections = "true"
    workspaceId               = "cca82599-4280-4ce1-8db8-0dc465ff83be"
  })
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "OmsAgentForLinux"
  type_handler_version = "1.4"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-001"
  depends_on = [
    azurerm_linux_virtual_machine.res-87,
  ]
}
resource "azurerm_virtual_machine_extension" "res-114" {
  auto_upgrade_minor_version = true
  name                       = "OmsAgentForLinux"
  publisher                  = "Microsoft.EnterpriseCloud.Monitoring"
  settings = jsonencode({
    azureResourceId           = null
    stopOnMultipleConnections = "true"
    workspaceId               = "cca82599-4280-4ce1-8db8-0dc465ff83be"
  })
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "OmsAgentForLinux"
  type_handler_version = "1.4"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-002"
  depends_on = [
    azurerm_linux_virtual_machine.res-89,
  ]
}
resource "azurerm_virtual_machine_extension" "res-115" {
  auto_upgrade_minor_version = true
  name                       = "OmsAgentForLinux"
  publisher                  = "Microsoft.EnterpriseCloud.Monitoring"
  settings = jsonencode({
    azureResourceId           = null
    stopOnMultipleConnections = "true"
    workspaceId               = "cca82599-4280-4ce1-8db8-0dc465ff83be"
  })
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "OmsAgentForLinux"
  type_handler_version = "1.4"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-003"
  depends_on = [
    azurerm_linux_virtual_machine.res-91,
  ]
}
resource "azurerm_virtual_machine_extension" "res-116" {
  auto_upgrade_minor_version = true
  name                       = "OmsAgentForLinux"
  publisher                  = "Microsoft.EnterpriseCloud.Monitoring"
  settings = jsonencode({
    azureResourceId           = null
    stopOnMultipleConnections = "true"
    workspaceId               = "cca82599-4280-4ce1-8db8-0dc465ff83be"
  })
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "OmsAgentForLinux"
  type_handler_version = "1.4"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-004"
  depends_on = [
    azurerm_linux_virtual_machine.res-93,
  ]
}
resource "azurerm_virtual_machine_extension" "res-117" {
  auto_upgrade_minor_version = true
  name                       = "OmsAgentForLinux"
  publisher                  = "Microsoft.EnterpriseCloud.Monitoring"
  settings = jsonencode({
    azureResourceId           = null
    stopOnMultipleConnections = "true"
    workspaceId               = "cca82599-4280-4ce1-8db8-0dc465ff83be"
  })
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "OmsAgentForLinux"
  type_handler_version = "1.4"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-005"
  depends_on = [
    azurerm_linux_virtual_machine.res-95,
  ]
}
resource "azurerm_virtual_machine_extension" "res-118" {
  auto_upgrade_minor_version = true
  name                       = "OmsAgentForLinux"
  publisher                  = "Microsoft.EnterpriseCloud.Monitoring"
  settings = jsonencode({
    azureResourceId           = null
    stopOnMultipleConnections = "true"
    workspaceId               = "cca82599-4280-4ce1-8db8-0dc465ff83be"
  })
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "OmsAgentForLinux"
  type_handler_version = "1.4"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-006"
  depends_on = [
    azurerm_linux_virtual_machine.res-97,
  ]
}
resource "azurerm_virtual_machine_extension" "res-119" {
  auto_upgrade_minor_version = true
  name                       = "OmsAgentForLinux"
  publisher                  = "Microsoft.EnterpriseCloud.Monitoring"
  settings = jsonencode({
    azureResourceId           = null
    stopOnMultipleConnections = "true"
    workspaceId               = "cca82599-4280-4ce1-8db8-0dc465ff83be"
  })
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "OmsAgentForLinux"
  type_handler_version = "1.4"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-007"
  depends_on = [
    azurerm_linux_virtual_machine.res-99,
  ]
}
resource "azurerm_virtual_machine_extension" "res-120" {
  auto_upgrade_minor_version = true
  name                       = "OmsAgentForLinux"
  publisher                  = "Microsoft.EnterpriseCloud.Monitoring"
  settings = jsonencode({
    azureResourceId           = null
    stopOnMultipleConnections = "true"
    workspaceId               = "cca82599-4280-4ce1-8db8-0dc465ff83be"
  })
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "OmsAgentForLinux"
  type_handler_version = "1.4"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-008"
  depends_on = [
    azurerm_linux_virtual_machine.res-101,
  ]
}
resource "azurerm_virtual_machine_extension" "res-121" {
  auto_upgrade_minor_version = true
  name                       = "OmsAgentForLinux"
  publisher                  = "Microsoft.EnterpriseCloud.Monitoring"
  settings = jsonencode({
    azureResourceId           = null
    stopOnMultipleConnections = "true"
    workspaceId               = "cca82599-4280-4ce1-8db8-0dc465ff83be"
  })
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "OmsAgentForLinux"
  type_handler_version = "1.4"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-010"
  depends_on = [
    azurerm_linux_virtual_machine.res-106,
  ]
}
resource "azurerm_virtual_machine_extension" "res-122" {
  auto_upgrade_minor_version = true
  name                       = "OmsAgentForLinux"
  publisher                  = "Microsoft.EnterpriseCloud.Monitoring"
  settings = jsonencode({
    azureResourceId           = null
    stopOnMultipleConnections = "true"
    workspaceId               = "cca82599-4280-4ce1-8db8-0dc465ff83be"
  })
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "OmsAgentForLinux"
  type_handler_version = "1.4"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-011"
  depends_on = [
    azurerm_linux_virtual_machine.res-108,
  ]
}
resource "azurerm_virtual_machine_extension" "res-123" {
  auto_upgrade_minor_version = true
  name                       = "OmsAgentForLinux"
  publisher                  = "Microsoft.EnterpriseCloud.Monitoring"
  settings = jsonencode({
    azureResourceId           = null
    stopOnMultipleConnections = "true"
    workspaceId               = "cca82599-4280-4ce1-8db8-0dc465ff83be"
  })
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "OmsAgentForLinux"
  type_handler_version = "1.4"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-012"
  depends_on = [
    azurerm_linux_virtual_machine.res-111,
  ]
}
resource "azurerm_arc_machine_extension" "res-124" {
  arc_machine_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.HybridCompute/machines/vm000005738"
  location       = "northeurope"
  name           = "MicrosoftMonitoringAgent"
  publisher      = "Microsoft.EnterpriseCloud.Monitoring"
  settings = jsonencode({
    stopOnMultipleConnections = "true"
    workspaceId               = "16fe0032-93cc-4161-a781-8c32f1bdfdfd"
  })
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
  type                 = "MicrosoftMonitoringAgent"
  type_handler_version = "1.0.18069.0"
}
resource "azurerm_arc_machine_extension" "res-125" {
  arc_machine_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.HybridCompute/machines/vm000005738"
  location       = "northeurope"
  name           = "WindowsOsUpdateExtension"
  publisher      = "Microsoft.SoftwareUpdateManagement"
  settings = jsonencode({
    updateConfiguration = {
      action     = "Assessment"
      activityId = "cb99a3b5-2767-4ce7-a198-2e3bf4b63479"
      startTime  = "2024-05-28T11:57:19.9415388Z"
    }
  })
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
  type                 = "WindowsOsUpdateExtension"
  type_handler_version = "1.0.26.0"
}
resource "azurerm_arc_machine_extension" "res-126" {
  arc_machine_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.HybridCompute/machines/vm000005739"
  location       = "northeurope"
  name           = "MicrosoftMonitoringAgent"
  publisher      = "Microsoft.EnterpriseCloud.Monitoring"
  settings = jsonencode({
    stopOnMultipleConnections = "true"
    workspaceId               = "16fe0032-93cc-4161-a781-8c32f1bdfdfd"
  })
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
  type                 = "MicrosoftMonitoringAgent"
  type_handler_version = "1.0.18069.0"
}
resource "azurerm_virtual_machine_extension" "res-127" {
  auto_upgrade_minor_version = true
  name                       = "AzureMonitorLinuxAgent"
  publisher                  = "Microsoft.Azure.Monitor"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "AzureMonitorLinuxAgent"
  type_handler_version = "1.6"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-001"
  depends_on = [
    azurerm_linux_virtual_machine.res-87,
  ]
}
resource "azurerm_virtual_machine_extension" "res-128" {
  auto_upgrade_minor_version = true
  name                       = "AzureMonitorLinuxAgent"
  publisher                  = "Microsoft.Azure.Monitor"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "AzureMonitorLinuxAgent"
  type_handler_version = "1.6"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-002"
  depends_on = [
    azurerm_linux_virtual_machine.res-89,
  ]
}
resource "azurerm_virtual_machine_extension" "res-129" {
  auto_upgrade_minor_version = true
  name                       = "AzureMonitorLinuxAgent"
  publisher                  = "Microsoft.Azure.Monitor"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "AzureMonitorLinuxAgent"
  type_handler_version = "1.6"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-003"
  depends_on = [
    azurerm_linux_virtual_machine.res-91,
  ]
}
resource "azurerm_virtual_machine_extension" "res-130" {
  auto_upgrade_minor_version = true
  name                       = "AzureMonitorLinuxAgent"
  publisher                  = "Microsoft.Azure.Monitor"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "AzureMonitorLinuxAgent"
  type_handler_version = "1.6"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-004"
  depends_on = [
    azurerm_linux_virtual_machine.res-93,
  ]
}
resource "azurerm_virtual_machine_extension" "res-131" {
  auto_upgrade_minor_version = true
  name                       = "AzureMonitorLinuxAgent"
  publisher                  = "Microsoft.Azure.Monitor"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "AzureMonitorLinuxAgent"
  type_handler_version = "1.6"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-005"
  depends_on = [
    azurerm_linux_virtual_machine.res-95,
  ]
}
resource "azurerm_virtual_machine_extension" "res-132" {
  auto_upgrade_minor_version = true
  name                       = "AzureMonitorLinuxAgent"
  publisher                  = "Microsoft.Azure.Monitor"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "AzureMonitorLinuxAgent"
  type_handler_version = "1.6"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-006"
  depends_on = [
    azurerm_linux_virtual_machine.res-97,
  ]
}
resource "azurerm_virtual_machine_extension" "res-133" {
  auto_upgrade_minor_version = true
  name                       = "AzureMonitorLinuxAgent"
  publisher                  = "Microsoft.Azure.Monitor"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "AzureMonitorLinuxAgent"
  type_handler_version = "1.6"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-007"
  depends_on = [
    azurerm_linux_virtual_machine.res-99,
  ]
}
resource "azurerm_virtual_machine_extension" "res-134" {
  auto_upgrade_minor_version = true
  name                       = "AzureMonitorLinuxAgent"
  publisher                  = "Microsoft.Azure.Monitor"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "AzureMonitorLinuxAgent"
  type_handler_version = "1.6"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-008"
  depends_on = [
    azurerm_linux_virtual_machine.res-101,
  ]
}
resource "azurerm_virtual_machine_extension" "res-135" {
  auto_upgrade_minor_version = true
  name                       = "AzureMonitorLinuxAgent"
  publisher                  = "Microsoft.Azure.Monitor"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "AzureMonitorLinuxAgent"
  type_handler_version = "1.6"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-010"
  depends_on = [
    azurerm_linux_virtual_machine.res-106,
  ]
}
resource "azurerm_virtual_machine_extension" "res-136" {
  auto_upgrade_minor_version = true
  name                       = "AzureMonitorLinuxAgent"
  publisher                  = "Microsoft.Azure.Monitor"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "AzureMonitorLinuxAgent"
  type_handler_version = "1.6"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-011"
  depends_on = [
    azurerm_linux_virtual_machine.res-108,
  ]
}
resource "azurerm_virtual_machine_extension" "res-137" {
  auto_upgrade_minor_version = true
  name                       = "AzureMonitorLinuxAgent"
  publisher                  = "Microsoft.Azure.Monitor"
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
    CostCentre                = "FD2000"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
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
  type                 = "AzureMonitorLinuxAgent"
  type_handler_version = "1.6"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-007/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-LGS-MAN-PRD-012"
  depends_on = [
    azurerm_linux_virtual_machine.res-111,
  ]
}
