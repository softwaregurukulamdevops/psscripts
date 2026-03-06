resource "azurerm_resource_group" "res-0" {
  location = "northeurope"
  name     = "M-CSSPZ-RG-MAN-PRD-003"
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
resource "azurerm_virtual_machine_extension" "res-1" {
  auto_upgrade_minor_version = true
  name                       = "MDE.Windows"
  publisher                  = "Microsoft.Azure.AzureDefenderForServers"
  settings = jsonencode({
    autoUpdate        = true
    azureResourceId   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-003/providers/Microsoft.Compute/virtualMachines/M-CSSPZ-VM-CYBERARK-MAN-PRD-001"
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
  type                 = "MDE.Windows"
  type_handler_version = "1.0"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-003/providers/Microsoft.Compute/virtualMachines/M-CSSPZ-VM-CYBERARK-MAN-PRD-001"
  depends_on = [
    azurerm_windows_virtual_machine.res-451,
  ]
}
resource "azurerm_user_assigned_identity" "res-2" {
  location            = "northeurope"
  name                = "R-CSSPZ-MI-MAN-PRD-001"
  resource_group_name = "M-CSSPZ-RG-MAN-PRD-003"
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
resource "azurerm_federated_identity_credential" "res-3" {
  audience            = ["api://AzureADTokenExchange"]
  issuer              = "https://vstoken.dev.azure.com/51150d51-ffd8-4b46-ad9a-12038c211b72"
  name                = "R-CSSPZ-MI-MAN-POOL-SC-PRD-001"
  parent_id           = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-003/providers/Microsoft.ManagedIdentity/userAssignedIdentities/R-CSSPZ-MI-MAN-PRD-001"
  resource_group_name = "M-CSSPZ-RG-MAN-PRD-003"
  subject             = "sc://BOIGroup-CCoE-CSSPZ/CSSPZ-LandingZone/R-CSSPZ-MI-MAN-POOL-SC-PRD-001"
  depends_on = [
    azurerm_user_assigned_identity.res-2,
  ]
}
resource "azurerm_federated_identity_credential" "res-4" {
  audience            = ["api://AzureADTokenExchange"]
  issuer              = "https://vstoken.dev.azure.com/51150d51-ffd8-4b46-ad9a-12038c211b72"
  name                = "R-CSSPZ-MI-MAN-PRD-001"
  parent_id           = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-003/providers/Microsoft.ManagedIdentity/userAssignedIdentities/R-CSSPZ-MI-MAN-PRD-001"
  resource_group_name = "M-CSSPZ-RG-MAN-PRD-003"
  subject             = "sc://BOIGroup-CCoE-CSSPZ/CSSPZ-LandingZone/R-CSSPZ-MI-MAN-PRD-001"
  depends_on = [
    azurerm_user_assigned_identity.res-2,
  ]
}
resource "azurerm_network_interface" "res-5" {
  location            = "northeurope"
  name                = "m-csspz-ovoc-image212_z1"
  resource_group_name = "M-CSSPZ-RG-MAN-PRD-003"
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
    name                          = "ipconfig1"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-001/providers/Microsoft.Network/virtualNetworks/M-CSSPZ-VNET-MAN-PRD-001/subnets/M-CSSPZ-SNET-FGT-PRD-001"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_network_interface_security_group_association" "res-6" {
  network_interface_id      = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-003/providers/Microsoft.Network/networkInterfaces/m-csspz-ovoc-image212_z1"
  network_security_group_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-003/providers/Microsoft.Network/networkSecurityGroups/M-CSSPZ-OVOC-IMAGE-nsg"
  depends_on = [
    azurerm_network_interface.res-5,
    azurerm_network_security_group.res-10,
  ]
}
resource "azurerm_network_interface" "res-7" {
  enable_accelerated_networking = true
  location                      = "northeurope"
  name                          = "m-csspz-vm-cyberark-man-prd-001315_z1"
  resource_group_name           = "M-CSSPZ-RG-MAN-PRD-003"
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
  ip_configuration {
    name                          = "ipconfig1"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-001/providers/Microsoft.Network/virtualNetworks/M-CSSPZ-VNET-MAN-PRD-001/subnets/R-CSSPZ-SNET-MAN-PRD-005"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_network_interface" "res-8" {
  location            = "northeurope"
  name                = "m-csspz-vm-snowsync-man-prd-001425_z1"
  resource_group_name = "M-CSSPZ-RG-MAN-PRD-003"
  tags = {
    "Account Type"               = "PLACEHOLDER"
    "App Support"                = "PLACEHOLDER"
    AppSupport                   = "PLACEHOLDER"
    "BOI Application"            = "PLACEHOLDER"
    "BOI Application Service"    = "PLACEHOLDER"
    Backup                       = "PLACEHOLDER"
    "Business Unit"              = "PLACEHOLDER"
    "Business function"          = "This is a test machine"
    BusinessUnit                 = "PLACEHOLDER"
    Compliance                   = "PLACEHOLDER"
    Confidentiality              = "PLACEHOLDER"
    "Cost Centre"                = "PLACEHOLDER"
    CostCentre                   = "PLACEHOLDER"
    "Data Sensitivity"           = "PLACEHOLDER"
    DataSensitivity              = "PLACEHOLDER"
    Description                  = "PLACEHOLDER"
    "Emergency Patching Windows" = "PLACEHOLDER"
    Environment                  = "Test"
    "Infra Support"              = "PLACEHOLDER"
    InfraSupport                 = "PLACEHOLDER"
    "Log Level"                  = "PLACEHOLDER"
    "Log Zone"                   = "PLACEHOLDER"
    MaintWinPatch                = "PLACEHOLDER"
    MaintWinPatchScan            = "PLACEHOLDER"
    "Managed By"                 = "CCoE"
    Manufacturer                 = "Microsoft"
    Name                         = "PLACEHOLDER"
    "Operating System"           = "PLACEHOLDER"
    OperatingSystem              = "PLACEHOLDER"
    "Operational status"         = "Live"
    "Owned By"                   = "CCoE"
    Owner                        = "PLACEHOLDER"
    PII                          = "PLACEHOLDER"
    "Patch Group"                = "PLACEHOLDER"
    Project                      = "PLACEHOLDER"
    "Server Criticality"         = "PLACEHOLDER"
    ServerCriticality            = "PLACEHOLDER"
    "Support Group"              = "HCL VIP Support"
    "Support Groups"             = "PLACEHOLDER"
  }
  ip_configuration {
    name                          = "ipconfig1"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-003/providers/Microsoft.Network/publicIPAddresses/M-CSSPZ-VM-SNOWSYNC-MAN-PRD-001-ip"
    subnet_id                     = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-001/providers/Microsoft.Network/virtualNetworks/M-CSSPZ-VNET-MAN-PRD-001/subnets/M-CSSPZ-SNET-MAN-PRD-001"
  }
  depends_on = [
    azurerm_public_ip.res-19,
  ]
}
resource "azurerm_network_interface_security_group_association" "res-9" {
  network_interface_id      = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-003/providers/Microsoft.Network/networkInterfaces/m-csspz-vm-snowsync-man-prd-001425_z1"
  network_security_group_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-003/providers/Microsoft.Network/networkSecurityGroups/M-CSSPZ-VM-SNOWSYNC-MAN-PRD-001-nsg"
  depends_on = [
    azurerm_network_interface.res-8,
    azurerm_network_security_group.res-15,
  ]
}
resource "azurerm_network_security_group" "res-10" {
  location            = "northeurope"
  name                = "M-CSSPZ-OVOC-IMAGE-nsg"
  resource_group_name = "M-CSSPZ-RG-MAN-PRD-003"
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
resource "azurerm_network_security_rule" "res-11" {
  access                      = "Allow"
  destination_address_prefix  = "*"
  destination_port_range      = "443"
  direction                   = "Inbound"
  name                        = "HTTPS"
  network_security_group_name = "M-CSSPZ-OVOC-IMAGE-nsg"
  priority                    = 1010
  protocol                    = "Tcp"
  resource_group_name         = "M-CSSPZ-RG-MAN-PRD-003"
  source_address_prefix       = "*"
  source_port_range           = "*"
  depends_on = [
    azurerm_network_security_group.res-10,
  ]
}
resource "azurerm_network_security_rule" "res-12" {
  access                      = "Allow"
  destination_address_prefix  = "*"
  destination_port_range      = "22"
  direction                   = "Inbound"
  name                        = "SSH"
  network_security_group_name = "M-CSSPZ-OVOC-IMAGE-nsg"
  priority                    = 1020
  protocol                    = "Tcp"
  resource_group_name         = "M-CSSPZ-RG-MAN-PRD-003"
  source_address_prefix       = "*"
  source_port_range           = "*"
  depends_on = [
    azurerm_network_security_group.res-10,
  ]
}
resource "azurerm_network_security_group" "res-13" {
  location            = "northeurope"
  name                = "M-CSSPZ-VM-CYBERARK-MAN-PRD-001-nsg"
  resource_group_name = "M-CSSPZ-RG-MAN-PRD-003"
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
resource "azurerm_network_security_group" "res-14" {
  location            = "northeurope"
  name                = "M-CSSPZ-VM-CYBERARK-MAN-PRD-002-nsg"
  resource_group_name = "M-CSSPZ-RG-MAN-PRD-003"
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
resource "azurerm_network_security_group" "res-15" {
  location            = "northeurope"
  name                = "M-CSSPZ-VM-SNOWSYNC-MAN-PRD-001-nsg"
  resource_group_name = "M-CSSPZ-RG-MAN-PRD-003"
  tags = {
    "Account Type"               = "PLACEHOLDER"
    "App Support"                = "PLACEHOLDER"
    AppSupport                   = "PLACEHOLDER"
    "BOI Application"            = "PLACEHOLDER"
    "BOI Application Service"    = "PLACEHOLDER"
    Backup                       = "PLACEHOLDER"
    "Business Unit"              = "PLACEHOLDER"
    "Business function"          = "This is a test machine"
    BusinessUnit                 = "PLACEHOLDER"
    Compliance                   = "PLACEHOLDER"
    Confidentiality              = "PLACEHOLDER"
    "Cost Centre"                = "PLACEHOLDER"
    CostCentre                   = "PLACEHOLDER"
    "Data Sensitivity"           = "PLACEHOLDER"
    DataSensitivity              = "PLACEHOLDER"
    Description                  = "PLACEHOLDER"
    "Emergency Patching Windows" = "PLACEHOLDER"
    Environment                  = "Test"
    "Infra Support"              = "PLACEHOLDER"
    InfraSupport                 = "PLACEHOLDER"
    "Log Level"                  = "PLACEHOLDER"
    "Log Zone"                   = "PLACEHOLDER"
    MaintWinPatch                = "PLACEHOLDER"
    MaintWinPatchScan            = "PLACEHOLDER"
    "Managed By"                 = "CCoE"
    Manufacturer                 = "Microsoft"
    Name                         = "PLACEHOLDER"
    "Operating System"           = "PLACEHOLDER"
    OperatingSystem              = "PLACEHOLDER"
    "Operational status"         = "Live"
    "Owned By"                   = "CCoE"
    Owner                        = "PLACEHOLDER"
    PII                          = "PLACEHOLDER"
    "Patch Group"                = "PLACEHOLDER"
    Project                      = "PLACEHOLDER"
    "Server Criticality"         = "PLACEHOLDER"
    ServerCriticality            = "PLACEHOLDER"
    "Support Group"              = "HCL VIP Support"
    "Support Groups"             = "PLACEHOLDER"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_network_security_group" "res-16" {
  location            = "northeurope"
  name                = "MCSSPZVMCYBERARKMANPRD001nsg105"
  resource_group_name = "M-CSSPZ-RG-MAN-PRD-003"
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
resource "azurerm_network_security_group" "res-17" {
  location            = "northeurope"
  name                = "MCSSPZVMCYBERARKMANPRD001nsg430"
  resource_group_name = "M-CSSPZ-RG-MAN-PRD-003"
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
resource "azurerm_network_security_group" "res-18" {
  location            = "northeurope"
  name                = "MCSSPZVMCYBERARKMANPRD001nsg497"
  resource_group_name = "M-CSSPZ-RG-MAN-PRD-003"
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
resource "azurerm_public_ip" "res-19" {
  allocation_method   = "Static"
  location            = "northeurope"
  name                = "M-CSSPZ-VM-SNOWSYNC-MAN-PRD-001-ip"
  resource_group_name = "M-CSSPZ-RG-MAN-PRD-003"
  sku                 = "Standard"
  tags = {
    "Account Type"               = "PLACEHOLDER"
    "App Support"                = "PLACEHOLDER"
    AppSupport                   = "PLACEHOLDER"
    "BOI Application"            = "PLACEHOLDER"
    "BOI Application Service"    = "PLACEHOLDER"
    Backup                       = "PLACEHOLDER"
    "Business Unit"              = "PLACEHOLDER"
    "Business function"          = "This is a test machine"
    BusinessUnit                 = "PLACEHOLDER"
    Compliance                   = "PLACEHOLDER"
    Confidentiality              = "PLACEHOLDER"
    "Cost Centre"                = "PLACEHOLDER"
    CostCentre                   = "PLACEHOLDER"
    "Data Sensitivity"           = "PLACEHOLDER"
    DataSensitivity              = "PLACEHOLDER"
    Description                  = "PLACEHOLDER"
    "Emergency Patching Windows" = "PLACEHOLDER"
    Environment                  = "Test"
    "Infra Support"              = "PLACEHOLDER"
    InfraSupport                 = "PLACEHOLDER"
    "Log Level"                  = "PLACEHOLDER"
    "Log Zone"                   = "PLACEHOLDER"
    MaintWinPatch                = "PLACEHOLDER"
    MaintWinPatchScan            = "PLACEHOLDER"
    "Managed By"                 = "CCoE"
    Manufacturer                 = "Microsoft"
    Name                         = "PLACEHOLDER"
    "Operating System"           = "PLACEHOLDER"
    OperatingSystem              = "PLACEHOLDER"
    "Operational status"         = "Live"
    "Owned By"                   = "CCoE"
    Owner                        = "PLACEHOLDER"
    PII                          = "PLACEHOLDER"
    "Patch Group"                = "PLACEHOLDER"
    Project                      = "PLACEHOLDER"
    "Server Criticality"         = "PLACEHOLDER"
    ServerCriticality            = "PLACEHOLDER"
    "Support Group"              = "HCL VIP Support"
    "Support Groups"             = "PLACEHOLDER"
  }
  zones = ["1"]
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_recovery_services_vault" "res-20" {
  location            = "northeurope"
  name                = "R-CSSPZ-RV-MAN-PRD-001"
  resource_group_name = "M-CSSPZ-RG-MAN-PRD-003"
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
  identity {
    type = "SystemAssigned"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_backup_policy_vm" "res-21" {
  name                = "DefaultPolicy"
  recovery_vault_name = "R-CSSPZ-RV-MAN-PRD-001"
  resource_group_name = "M-CSSPZ-RG-MAN-PRD-003"
  backup {
    frequency = "Daily"
    time      = "03:30"
  }
  retention_daily {
    count = 30
  }
  depends_on = [
    azurerm_recovery_services_vault.res-20,
  ]
}
resource "azurerm_backup_policy_vm" "res-22" {
  name                = "EnhancedPolicy"
  policy_type         = "V2"
  recovery_vault_name = "R-CSSPZ-RV-MAN-PRD-001"
  resource_group_name = "M-CSSPZ-RG-MAN-PRD-003"
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
    azurerm_recovery_services_vault.res-20,
  ]
}
resource "azurerm_backup_policy_vm_workload" "res-23" {
  name                = "HourlyLogBackup"
  recovery_vault_name = "R-CSSPZ-RV-MAN-PRD-001"
  resource_group_name = "M-CSSPZ-RG-MAN-PRD-003"
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
      time      = "03:30"
    }
    retention_daily {
      count = 30
    }
  }
  settings {
    time_zone = "UTC"
  }
  depends_on = [
    azurerm_recovery_services_vault.res-20,
  ]
}
resource "azurerm_backup_policy_vm_workload" "res-24" {
  name                = "SQL-Backup-Default"
  recovery_vault_name = "R-CSSPZ-RV-MAN-PRD-001"
  resource_group_name = "M-CSSPZ-RG-MAN-PRD-003"
  workload_type       = "SQLDataBase"
  protection_policy {
    policy_type = "Full"
    backup {
      frequency = "Daily"
      time      = "23:00"
    }
    retention_daily {
      count = 30
    }
  }
  settings {
    time_zone = "UTC"
  }
  depends_on = [
    azurerm_recovery_services_vault.res-20,
  ]
}
resource "azurerm_backup_policy_vm" "res-25" {
  name                = "VM-Backup-Default"
  recovery_vault_name = "R-CSSPZ-RV-MAN-PRD-001"
  resource_group_name = "M-CSSPZ-RG-MAN-PRD-003"
  backup {
    frequency = "Daily"
    time      = "23:00"
  }
  retention_daily {
    count = 35
  }
  depends_on = [
    azurerm_recovery_services_vault.res-20,
  ]
}
resource "azurerm_backup_policy_vm" "res-26" {
  name                = "VM-Backup-EnhancedPolicy"
  policy_type         = "V2"
  recovery_vault_name = "R-CSSPZ-RV-MAN-PRD-001"
  resource_group_name = "M-CSSPZ-RG-MAN-PRD-003"
  backup {
    frequency = "Daily"
    time      = "23:00"
  }
  retention_daily {
    count = 35
  }
  depends_on = [
    azurerm_recovery_services_vault.res-20,
  ]
}
resource "azurerm_monitor_activity_log_alert" "res-30" {
  name                = "Test Azure and ServiceNow sync"
  resource_group_name = "M-CSSPZ-RG-MAN-PRD-003"
  scopes              = ["/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/m-csspz-rg-man-prd-003/providers/Microsoft.Compute/virtualMachines/M-CSSPZ-VM-CYBERARK-MAN-PRD-001"]
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
  action {
    action_group_id = "/subscriptions/b97da650-b444-4530-9f4b-968706a96e1b/resourcegroups/m-csspz-rg-soc-prd-001/providers/microsoft.insights/actiongroups/servicenow azure monitor sync"
    webhook_properties = {
      AssignmentGroup = "HCL-VIP-Support"
      Service         = "Azure Landing Zone Application Service"
      SubType         = "VM Health Degraded"
      Type            = "Performance"
    }
  }
  criteria {
    category = "Administrative"
  }
  depends_on = [
    azurerm_windows_virtual_machine.res-451,
  ]
}
resource "azurerm_automation_account" "res-31" {
  location            = "northeurope"
  name                = "R-CSSPZ-AA-MAN-PRD-001"
  resource_group_name = "m-csspz-rg-man-prd-003"
  sku_name            = "Basic"
  tags = {
    "Account Type"    = "PLACEHOLDER"
    AppSupport        = "PLACEHOLDER"
    BusinessUnit      = "PLACEHOLDER"
    Confidentiality   = "PLACEHOLDER"
    CostCentre        = "PLACEHOLDER"
    DataSensitivity   = "PLACEHOLDER"
    Description       = "PLACEHOLDER"
    Environment       = "PLACEHOLDER"
    InfraSupport      = "PLACEHOLDER"
    Name              = "PLACEHOLDER"
    OperatingSystem   = "PLACEHOLDER"
    Owner             = "PLACEHOLDER"
    PII               = "PLACEHOLDER"
    Project           = "PLACEHOLDER"
    ServerCriticality = "PLACEHOLDER"
  }
  identity {
    identity_ids = ["/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-SC-PRD-001/providers/Microsoft.ManagedIdentity/userAssignedIdentities/R-CSSPZ-MI-MAN-POL-SC-PRD-001"]
    type         = "SystemAssigned, UserAssigned"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_automation_connection_type" "res-32" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  is_global               = true
  name                    = "Azure"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  field {
    name = "AutomationCertificateName"
    type = "System.String"
  }
  field {
    name = "SubscriptionID"
    type = "System.String"
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_connection_type" "res-33" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  is_global               = true
  name                    = "AzureClassicCertificate"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  field {
    name = "CertificateAssetName"
    type = "System.String"
  }
  field {
    name = "SubscriptionId"
    type = "System.String"
  }
  field {
    name = "SubscriptionName"
    type = "System.String"
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_connection_type" "res-34" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  is_global               = true
  name                    = "AzureServicePrincipal"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  field {
    name = "SubscriptionId"
    type = "System.String"
  }
  field {
    name = "TenantId"
    type = "System.String"
  }
  field {
    name = "ApplicationId"
    type = "System.String"
  }
  field {
    name = "CertificateThumbprint"
    type = "System.String"
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_job_schedule" "res-311" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  parameters = {
    action   = "start"
    tagname  = "operational_schedule"
    tagvalue = "csspz-autoshutdown"
  }
  resource_group_name = "m-csspz-rg-man-prd-003"
  runbook_name        = "R-VM-START-STOP"
  schedule_name       = "CSSPZ-AutoShutdown-patch-start"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_job_schedule" "res-312" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  parameters = {
    action   = "start"
    tagname  = "operational_schedule"
    tagvalue = "csspz-ie-office-hours"
  }
  resource_group_name = "m-csspz-rg-man-prd-003"
  runbook_name        = "R-VM-START-STOP"
  schedule_name       = "CSSPZ-ie-office-hours-start"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_job_schedule" "res-313" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  parameters = {
    action   = "start"
    tagname  = "operational_schedule"
    tagvalue = "csspz-india-office-hours"
  }
  resource_group_name = "m-csspz-rg-man-prd-003"
  runbook_name        = "R-VM-START-STOP"
  schedule_name       = "CSSPZ-india-office-hours-start"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_job_schedule" "res-314" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  parameters = {
    action   = "start"
    tagname  = "operational_schedule"
    tagvalue = "csspz-ie-office-hours"
  }
  resource_group_name = "m-csspz-rg-man-prd-003"
  runbook_name        = "R-VM-START-STOP"
  schedule_name       = "CSSPZ-ie-office-hours-patch-start"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_job_schedule" "res-315" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  parameters = {
    action   = "stop"
    tagname  = "operational_schedule"
    tagvalue = "csspz-ie-office-hours"
  }
  resource_group_name = "m-csspz-rg-man-prd-003"
  runbook_name        = "R-VM-START-STOP"
  schedule_name       = "CSSPZ-ie-office-hours-patch-stop"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_job_schedule" "res-316" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  parameters = {
    action   = "stop"
    tagname  = "operational_schedule"
    tagvalue = "csspz-india-office-hours"
  }
  resource_group_name = "m-csspz-rg-man-prd-003"
  runbook_name        = "R-VM-START-STOP"
  schedule_name       = "CSSPZ-india-office-hours-stop"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_job_schedule" "res-317" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  parameters = {
    action   = "stop"
    tagname  = "operational_schedule"
    tagvalue = "csspz-ie-office-hours"
  }
  resource_group_name = "m-csspz-rg-man-prd-003"
  runbook_name        = "R-VM-START-STOP"
  schedule_name       = "CSSPZ-ie-office-hours-stop"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_job_schedule" "res-318" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  parameters = {
    action   = "stop"
    tagname  = "operational_schedule"
    tagvalue = "csspz-eu-office-hours"
  }
  resource_group_name = "m-csspz-rg-man-prd-003"
  runbook_name        = "R-VM-START-STOP"
  schedule_name       = "CSSPZ-eu-office-hours-stop"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_job_schedule" "res-319" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  runbook_name            = "M-TagPolicy-Remediation-Runbook-PRD"
  schedule_name           = "m-Tagpolicy-remediation-runbook-prd-schedule"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_job_schedule" "res-320" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  parameters = {
    action   = "stop"
    tagname  = "operational_schedule"
    tagvalue = "csspz-eu-office-hours"
  }
  resource_group_name = "m-csspz-rg-man-prd-003"
  runbook_name        = "R-VM-START-STOP"
  schedule_name       = "CSSPZ-eu-office-hours-patch-stop"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_job_schedule" "res-321" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  runbook_name            = "R-AUM-ATTACH-VM"
  schedule_name           = "R-CSSPZ-Workload-MW-PatchNightly-12pm"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_job_schedule" "res-322" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  parameters = {
    action   = "stop"
    tagname  = "operational_schedule"
    tagvalue = "csspz-india-office-hours"
  }
  resource_group_name = "m-csspz-rg-man-prd-003"
  runbook_name        = "R-VM-START-STOP"
  schedule_name       = "CSSPZ-india-office-hours-patch-stop"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_job_schedule" "res-323" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  runbook_name            = "R-AUM-ATTACH-VM"
  schedule_name           = "R-CSSPZ-Workload-MW-PatchNightly-12am"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_job_schedule" "res-324" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  parameters = {
    action   = "stop"
    tagname  = "operational_schedule"
    tagvalue = "csspz-autoshutdown"
  }
  resource_group_name = "m-csspz-rg-man-prd-003"
  runbook_name        = "R-VM-START-STOP"
  schedule_name       = "CSSPZ-AutoShutdown-patch-stop"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_job_schedule" "res-325" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  parameters = {
    action   = "stop"
    tagname  = "operational_schedule"
    tagvalue = "csspz-AutoShutdown"
  }
  resource_group_name = "m-csspz-rg-man-prd-003"
  runbook_name        = "R-VM-START-STOP"
  schedule_name       = "CSSPZ-AutoShutdown-stop"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_job_schedule" "res-326" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  parameters = {
    action   = "start"
    tagname  = "operational_schedule"
    tagvalue = "csspz-india-office-hours"
  }
  resource_group_name = "m-csspz-rg-man-prd-003"
  runbook_name        = "R-VM-START-STOP"
  schedule_name       = "CSSPZ-india-office-hours-patch-start"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_job_schedule" "res-327" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  parameters = {
    action   = "start"
    tagname  = "operational_schedule"
    tagvalue = "csspz-eu-office-hours"
  }
  resource_group_name = "m-csspz-rg-man-prd-003"
  runbook_name        = "R-VM-START-STOP"
  schedule_name       = "CSSPZ-eu-office-hours-patch-start"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_job_schedule" "res-328" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  parameters = {
    action   = "start"
    tagname  = "operational_schedule"
    tagvalue = "csspz-eu-office-hours"
  }
  resource_group_name = "m-csspz-rg-man-prd-003"
  runbook_name        = "R-VM-START-STOP"
  schedule_name       = "CSSPZ-eu-office-hours-start"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-329" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "AuditPolicyDsc"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-330" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-331" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.Accounts"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-332" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.Advisor"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-333" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.Aks"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-334" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.AnalysisServices"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-335" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.ApiManagement"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-336" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.AppConfiguration"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-337" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.ApplicationInsights"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-338" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.Attestation"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-339" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.Automation"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-340" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.Batch"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-341" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.Billing"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-342" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.Cdn"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-343" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.CloudService"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-344" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.CognitiveServices"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-345" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.Compute"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-346" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.ContainerInstance"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-347" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.ContainerRegistry"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-348" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.CosmosDB"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-349" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.DataBoxEdge"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-350" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.DataFactory"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-351" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.DataLakeAnalytics"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-352" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.DataLakeStore"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-353" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.DataShare"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-354" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.Databricks"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-355" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.DeploymentManager"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-356" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.DesktopVirtualization"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-357" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.DevTestLabs"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-358" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.Dns"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-359" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.EventGrid"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-360" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.EventHub"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-361" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.FrontDoor"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-362" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.Functions"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-363" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.HDInsight"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-364" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.HealthcareApis"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-365" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.IotHub"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-366" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.KeyVault"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-367" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.Kusto"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-368" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.LogicApp"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-369" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.MachineLearning"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-370" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.Maintenance"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-371" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.ManagedServiceIdentity"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-372" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.ManagedServices"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-373" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.MarketplaceOrdering"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-374" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.Media"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-375" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.Migrate"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-376" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.Monitor"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-377" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.MySql"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-378" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.Network"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-379" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.NotificationHubs"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-380" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.OperationalInsights"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-381" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.PolicyInsights"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-382" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.PostgreSql"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-383" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.PowerBIEmbedded"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-384" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.PrivateDns"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-385" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.RecoveryServices"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-386" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.RedisCache"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-387" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.RedisEnterpriseCache"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-388" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.Relay"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-389" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.ResourceMover"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-390" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.Resources"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-391" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.Security"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-392" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.SecurityInsights"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-393" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.ServiceBus"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-394" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.ServiceFabric"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-395" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.SignalR"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-396" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.Sql"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-397" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.SqlVirtualMachine"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-398" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.StackHCI"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-399" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.Storage"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-400" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.StorageSync"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-401" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.StreamAnalytics"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-402" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.Support"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-403" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.Synapse"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-404" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.TrafficManager"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-405" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Az.Websites"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-406" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Azure"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-407" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Azure.Storage"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-408" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "AzureRM.Automation"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-409" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "AzureRM.Compute"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-410" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "AzureRM.Profile"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-411" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "AzureRM.Resources"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-412" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "AzureRM.Sql"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-413" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "AzureRM.Storage"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-414" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "ComputerManagementDsc"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-415" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "GPRegistryPolicyParser"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-416" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Microsoft.PowerShell.Core"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-417" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Microsoft.PowerShell.Diagnostics"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-418" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Microsoft.PowerShell.Management"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-419" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Microsoft.PowerShell.Security"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-420" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Microsoft.PowerShell.Utility"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-421" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Microsoft.WSMan.Management"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-422" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "Orchestrator.AssetManagement.Cmdlets"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-423" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "PSDscResources"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-424" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "SecurityPolicyDsc"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-425" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "StateConfigCompositeResources"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-426" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "xDSCDomainjoin"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-427" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "xPowerShellExecutionPolicy"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-428" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  name                    = "xRemoteDesktopAdmin"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_schedule" "res-429" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  description             = "start VMs during ie patch office hours"
  frequency               = "Week"
  name                    = "CSSPZ-AutoShutdown-patch-start"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  timezone                = "Europe/Dublin"
  week_days               = ["Tuesday"]
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_schedule" "res-430" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  description             = "stop VMs during ie office hours"
  frequency               = "Week"
  name                    = "CSSPZ-AutoShutdown-patch-stop"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  timezone                = "Europe/Dublin"
  week_days               = ["Tuesday"]
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_schedule" "res-431" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  description             = "stop VMs during AutoShutdown hours"
  frequency               = "Week"
  name                    = "CSSPZ-AutoShutdown-stop"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  timezone                = "Europe/Dublin"
  week_days               = ["Friday", "Monday", "Thursday", "Tuesday", "Wednesday"]
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_schedule" "res-432" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  description             = "start VMs during ie patch office hours"
  frequency               = "Week"
  name                    = "CSSPZ-eu-office-hours-patch-start"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  timezone                = "Europe/Dublin"
  week_days               = ["Tuesday"]
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_schedule" "res-433" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  description             = "stop VMs during ie office hours"
  frequency               = "Week"
  name                    = "CSSPZ-eu-office-hours-patch-stop"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  timezone                = "Europe/Dublin"
  week_days               = ["Tuesday"]
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_schedule" "res-434" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  description             = "stop VMs during EU office hours"
  frequency               = "Week"
  name                    = "CSSPZ-eu-office-hours-start"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  timezone                = "Europe/Dublin"
  week_days               = ["Friday", "Monday", "Thursday", "Tuesday", "Wednesday"]
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_schedule" "res-435" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  description             = "stop VMs during EU office hours"
  frequency               = "Week"
  name                    = "CSSPZ-eu-office-hours-stop"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  timezone                = "Europe/Dublin"
  week_days               = ["Friday", "Monday", "Thursday", "Tuesday", "Wednesday"]
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_schedule" "res-436" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  description             = "start VMs during ie patch office hours"
  frequency               = "Week"
  name                    = "CSSPZ-ie-office-hours-patch-start"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  timezone                = "Europe/Dublin"
  week_days               = ["Tuesday"]
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_schedule" "res-437" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  description             = "stop VMs during ie office hours"
  frequency               = "Week"
  name                    = "CSSPZ-ie-office-hours-patch-stop"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  timezone                = "Europe/Dublin"
  week_days               = ["Tuesday"]
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_schedule" "res-438" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  description             = "start VMs during ie office hours"
  frequency               = "Week"
  name                    = "CSSPZ-ie-office-hours-start"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  timezone                = "Europe/Dublin"
  week_days               = ["Friday", "Monday", "Thursday", "Tuesday", "Wednesday"]
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_schedule" "res-439" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  description             = "stop VMs during ie office hours"
  frequency               = "Week"
  name                    = "CSSPZ-ie-office-hours-stop"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  timezone                = "Europe/Dublin"
  week_days               = ["Friday", "Monday", "Thursday", "Tuesday", "Wednesday"]
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_schedule" "res-440" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  description             = "start VMs patch india office hours"
  frequency               = "Week"
  name                    = "CSSPZ-india-office-hours-patch-start"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  timezone                = "Europe/Dublin"
  week_days               = ["Tuesday"]
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_schedule" "res-441" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  description             = "stop VMs patch india office hours"
  frequency               = "Week"
  name                    = "CSSPZ-india-office-hours-patch-stop"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  timezone                = "Europe/Dublin"
  week_days               = ["Tuesday"]
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_schedule" "res-442" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  description             = "start VMs during india office hours"
  frequency               = "Week"
  name                    = "CSSPZ-india-office-hours-start"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  timezone                = "Europe/Dublin"
  week_days               = ["Friday", "Monday", "Thursday", "Tuesday", "Wednesday"]
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_schedule" "res-443" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  description             = "stop VMs during india office hours"
  frequency               = "Week"
  name                    = "CSSPZ-india-office-hours-stop"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  timezone                = "Europe/Dublin"
  week_days               = ["Friday", "Monday", "Thursday", "Tuesday", "Wednesday"]
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_schedule" "res-444" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  description             = "Run every day at 12am"
  frequency               = "Day"
  name                    = "R-CSSPZ-Workload-MW-PatchNightly-12am"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  timezone                = "Europe/Dublin"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_schedule" "res-445" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  description             = "Run every day at 12pm"
  frequency               = "Day"
  name                    = "R-CSSPZ-Workload-MW-PatchNightly-12pm"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  timezone                = "Europe/Dublin"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_schedule" "res-446" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  frequency               = "Day"
  name                    = "m-Tagpolicy-remediation-runbook-prd-schedule"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  timezone                = "Europe/Dublin"
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_runbook" "res-447" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  content                 = "# To resolve the question of running a remediation task for a policy assignment\r\n\r\n# Step 1: Retrieve all policy assignments to identify the target for remediation\r\n\r\ntry\r\n{\r\n    \"Logging in to Azure...\"\r\n    Connect-AzAccount -Identity -AccountId \"a139e097-5a1c-4b9f-a6fd-347f260b3bff\"\r\n}\r\ncatch {\r\n    Write-Error -Message $_.Exception\r\n    throw $_.Exception\r\n}\r\n\r\n# Step 2: Start a remediation task for the specified policy assignment\r\n$policyAssignmentId = \"/providers/microsoft.management/managementgroups/boiprod/providers/microsoft.authorization/policyassignments/dfc_azure_arc_policy_asg\" # Replace with actual subscription and policy assignment ID\r\n\r\nStart-AzPolicyRemediation -ManagementGroupName \"BOIProd\" -PolicyAssignmentId $policyAssignmentId -Name \"remediationTask\" \r\n\r\nWrite-Output \"Remediation task successfully added\""
  location                = "northeurope"
  log_progress            = false
  log_verbose             = false
  name                    = "M-TagPolicy-Remediation-Runbook-PRD"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  runbook_type            = "PowerShell72"
  tags = {
    "Account Type"    = "PLACEHOLDER"
    AppSupport        = "PLACEHOLDER"
    BusinessUnit      = "PLACEHOLDER"
    Confidentiality   = "PLACEHOLDER"
    CostCentre        = "FD2000"
    DataSensitivity   = "PLACEHOLDER"
    Description       = "PLACEHOLDER"
    InfraSupport      = "HCL-VIP-Support"
    Name              = "PLACEHOLDER"
    OperatingSystem   = "PLACEHOLDER"
    Owner             = "Daniel Dalla"
    PII               = "PLACEHOLDER"
    Project           = "PLACEHOLDER"
    ServerCriticality = "PLACEHOLDER"
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_runbook" "res-448" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  content                 = "$TagPairs = @(\r\n    @{ TagName = \"MaintWinPatch\"; TagValue = \"Nightly_patch\" }\r\n    @{ TagName = \"MaintWinPatch\"; TagValue = \"PilotGrp1\" }\r\n    @{ TagName = \"MaintWinPatch\"; TagValue = \"PilotGrp2\" }\r\n    @{ TagName = \"MaintWinPatch\"; TagValue = \"PilotGrp3\" }\r\n    @{ TagName = \"MaintWinPatch\"; TagValue = \"TestGrp1\" }\r\n    @{ TagName = \"MaintWinPatch\"; TagValue = \"TestGrp2\" }\r\n    @{ TagName = \"MaintWinPatch\"; TagValue = \"TestGrp3\" }\r\n    @{ TagName = \"MaintWinPatch\"; TagValue = \"PrepGrp1\" }\r\n    @{ TagName = \"MaintWinPatch\"; TagValue = \"PrepGrp2\" }\r\n    @{ TagName = \"MaintWinPatch\"; TagValue = \"PrepGrp3\" }\r\n    @{ TagName = \"MaintWinPatch\"; TagValue = \"ProdGrp1\" }\r\n    @{ TagName = \"MaintWinPatch\"; TagValue = \"ProdGrp2\" }\r\n    @{ TagName = \"MaintWinPatch\"; TagValue = \"ProdGrp3\" }\r\n    @{ TagName = \"MaintWinScan\"; TagValue = \"Nightly_scan\" }\r\n)\r\n \r\n \r\n #$TagName=\"maintainance\"\r\n #$TagValue=\"daily\"\r\n #$resourceGroup = \"DefaultResourceGroup-CCAN\"\r\n \r\n# Connect to Azure (if not already connected)\r\n# Authenticate with Managed Identity\r\nWrite-OutPut \"Starting Point\"\r\nDisable-AzContextAutosave -Scope Process\r\nConnect-AzAccount -Identity\r\nWrite-OutPut \"Authenticated\"\r\n \r\n# Parameters\r\n# $tagName = \"patch\"    # Specify your tag name\r\n# $tagValue = \"patch-001\"     # Specify your tag value\r\n#$maxConcurrentJobs = 10    # Maximum number of concurrent jobs\r\n \r\n# Function to process VMs in a subscription\r\nfunction Process-VMs {\r\nparam (\r\n    [string]$SubscriptionId,\r\n    [string]$SubscriptionName\r\n)\r\n  az account set --subscription $SubscriptionId\r\n \r\n Set-AzContext -SubscriptionId $SubscriptionId\r\n \r\nWrite-OutPut \"`nProcessing Subscription: $SubscriptionName ($SubscriptionId)\"\r\n \r\n# Get all VMs with the specified tag\r\n \r\n$vms = Get-AzVM | Where-Object {\r\n    $vm = $_\r\n    $TagPairs | Where-Object {\r\n        $vm.Tags.Keys -contains $_.TagName -and $vm.Tags[$_.TagName] -eq $_.TagValue\r\n    }\r\n}\r\nif ($vms.Count -eq 0) {\r\n    Write-OutPut \"No VMs found with tag $tagName = $tagValue in subscription $SubscriptionName\"\r\n    return\r\n}\r\n \r\n# Get all existing maintenance configurations in the RG\r\n#$maintenanceConfigs = Get-AzMaintenanceConfiguration -ResourceGroupName \"DefaultResourceGroup-CCAN\"\r\n \r\n \r\n foreach ($vm in $vms) {\r\n   Write-Host \"`nProcessing VM: $($vm.Name)\"\r\n \r\n    # Check OS Type\r\n    if ($vm.StorageProfile.OSDisk.OSType -eq \"Windows\") {\r\n        Write-Host \"Detected Windows VM\"\r\n \r\n        # Set patch mode\r\n        Set-AzVMOperatingSystem -VM $vm -Windows -PatchMode \"AutomaticByPlatform\" | Out-Null\r\n \r\n        # Ensure patch settings exist\r\n        if (-not $vm.OSProfile.WindowsConfiguration.PatchSettings) {\r\n            $vm.OSProfile.WindowsConfiguration.PatchSettings = New-Object -TypeName Microsoft.Azure.Management.Compute.Models.WindowsVMGuestPatchSettings\r\n        }\r\n \r\n        # Check and apply AutomaticByPlatformSettings\r\n        $autoSettings = $vm.OSProfile.WindowsConfiguration.PatchSettings.AutomaticByPlatformSettings\r\n        if (-not $autoSettings) {\r\n            $vm.OSProfile.WindowsConfiguration.PatchSettings.AutomaticByPlatformSettings = New-Object -TypeName Microsoft.Azure.Management.Compute.Models.WindowsVMGuestPatchAutomaticByPlatformSettings -Property @{\r\n                BypassPlatformSafetyChecksOnUserSchedule = $true\r\n            }\r\n        } else {\r\n            $autoSettings.BypassPlatformSafetyChecksOnUserSchedule = $true\r\n        }\r\n         Write-Host \"Updating VM: $($vm.Name)\"\r\n    Update-AzVM -VM $vm -ResourceGroupName $vm.ResourceGroupName\r\n    }\r\n    elseif ($vm.StorageProfile.OSDisk.OSType -eq \"Linux\") {\r\n        Write-Host \"Detected Linux VM\"\r\n \r\n        # Set patch mode\r\n        Set-AzVMOperatingSystem -VM $vm -Linux -PatchMode \"AutomaticByPlatform\" | Out-Null\r\n \r\n        # Ensure patch settings exist\r\n        if (-not $vm.OSProfile.LinuxConfiguration.PatchSettings) {\r\n            $vm.OSProfile.LinuxConfiguration.PatchSettings = New-Object -TypeName Microsoft.Azure.Management.Compute.Models.LinuxVMGuestPatchSettings\r\n        }\r\n \r\n        # Check and apply AutomaticByPlatformSettings\r\n        $autoSettings = $vm.OSProfile.LinuxConfiguration.PatchSettings.AutomaticByPlatformSettings\r\n        if (-not $autoSettings) {\r\n            $vm.OSProfile.LinuxConfiguration.PatchSettings.AutomaticByPlatformSettings = New-Object -TypeName Microsoft.Azure.Management.Compute.Models.LinuxVMGuestPatchAutomaticByPlatformSettings -Property @{\r\n                BypassPlatformSafetyChecksOnUserSchedule = $true\r\n            }\r\n        } else {\r\n            $autoSettings.BypassPlatformSafetyChecksOnUserSchedule = $true\r\n        }\r\n         Write-Host \"Updating VM: $($vm.Name)\"\r\n    Update-AzVM -VM $vm -ResourceGroupName $vm.ResourceGroupName\r\n    }\r\n     else {\r\n        Write-Warning \"Unknown OS type for VM: $($vm.Name). Skipping.\"\r\n        continue\r\n    }\r\n \r\n    # Apply the change\r\n   \r\n$vmName = $vm.Name\r\n  $rgName = $vm.ResourceGroupName\r\n    # Get the value of the tag for the input tag name\r\n$tagKey = $TagPairs | Where-Object { $vm.Tags.ContainsKey($_.TagName) } | Select-Object -First 1 -ExpandProperty TagName\r\n$tagValue = $null\r\nif ($tagKey) {\r\n    $tagValue = $vm.Tags[$tagKey]\r\n}\r\n    Write-OutPut \" VM '$vmName' has tag $tagKey = '$tagValue'\"\r\n    # Step 1: Get the access token\r\n    $configId = Get-MaintenanceConfigIdByName -ConfigName $tagValue\r\n#$accessToken = (az account get-access-token --query accessToken -o tsv)\r\n$accessToken = (Get-AzAccessToken -ResourceUrl \"https://management.azure.com/\").Token\r\n# Step 2: Set the URL and request body\r\n$url = \"https://management.azure.com/subscriptions/$SubscriptionId/resourceGroups/$rgName/providers/Microsoft.Compute/virtualMachines/$vmName/providers/Microsoft.Maintenance/configurationAssignments/$vmName\"+\"?api-version=2021-09-01-preview\"\r\n \r\n \r\n$body = @{\r\n    location = \"eastus\"\r\n    properties = @{\r\n        maintenanceConfigurationId = $configId\r\n    }\r\n} | ConvertTo-Json -Depth 5\r\n \r\n# Step 3: Set headers\r\n$headers = @{\r\n    Authorization = \"Bearer $accessToken\"\r\n    \"Content-Type\" = \"application/json\"\r\n}\r\n \r\n# Step 4: Make the PUT request\r\n \r\ntry {\r\n    $response = Invoke-RestMethod -Method PUT -Uri $url -Headers $headers -Body $body\r\n    Write-OutPut \"Success!\"\r\n    $response\r\n} catch {\r\n    Write-OutPut \"Request failed:\"\r\n   \r\n    $respStream = $_.Exception.Response.GetResponseStream()\r\n    $reader = New-Object System.IO.StreamReader($respStream)\r\n    $reader.BaseStream.Position = 0\r\n    $reader.DiscardBufferedData()\r\n    $responseBody = $reader.ReadToEnd()\r\n   \r\n    try {\r\n        $json = $responseBody | ConvertFrom-Json\r\n        $json | Format-List\r\n    } catch {\r\n        Write-OutPut \"Raw response:\"\r\n        Write-Output $responseBody\r\n    }\r\n}\r\n \r\n \r\n}\r\n}\r\n \r\n function Get-MaintenanceConfigIdByName {\r\n    param(\r\n        [Parameter(Mandatory = $true)]\r\n        [string]$ConfigName\r\n    )\r\n \r\n    # Ensure logged in\r\n    if (-not (Get-AzContext)) {\r\n        Connect-AzAccount | Out-Null\r\n    }\r\n \r\n    $apiVersion = \"2023-04-01\"\r\n    $subscriptions = Get-AzSubscription\r\n    foreach ($sub in $subscriptions) {\r\n        # Set subscription context\r\n        Set-AzContext -SubscriptionId $sub.Id | Out-Null\r\n \r\n        # Build API URI\r\n        $uri = \"https://management.azure.com/subscriptions/$($sub.Id)/providers/Microsoft.Maintenance/maintenanceConfigurations?api-version=$apiVersion\"\r\n \r\n        # Get access token\r\n        $accessToken = (Get-AzAccessToken).Token\r\n \r\n        $headers = @{\r\n            'Authorization' = \"Bearer $accessToken\"\r\n            'Content-Type'  = 'application/json'\r\n        }\r\n \r\n        try {\r\n            $response = Invoke-RestMethod -Uri $uri -Method Get -Headers $headers\r\n            $configs = $response.value\r\n \r\n            # Filter by name\r\n            $match = $configs | Where-Object { $_.name -eq $ConfigName } | Select-Object -First 1\r\n \r\n            if ($match) {\r\n                return $match.id\r\n            }\r\n        }\r\n        catch {\r\n            Write-Warning \"Failed to query subscription $($sub.Id): $_\"\r\n        }\r\n    }\r\n \r\n    # If nothing found, return null\r\n    return $null\r\n}\r\n \r\n# Main script\r\ntry {\r\nWrite-OutPut \"Getting Subscriptions\"\r\n$subscriptions = Get-AzSubscription\r\n Write-OutPut $subscriptions\r\n \r\nforeach ($sub in $subscriptions) {\r\n    Set-AzContext -SubscriptionId $sub.Id | Out-Null\r\n    Write-OutPut $Sub.id\r\n    Process-VMs -SubscriptionId $sub.Id -SubscriptionName $sub.Name\r\n}\r\n #Process-VMs -SubscriptionId $sub.Id -SubscriptionName \"CSSP_AZR_MANAGEMENT\"\r\n}\r\ncatch {\r\nWrite-OutPut \"Error: $_\" -ForegroundColor Red\r\n}\r\nfinally {\r\nGet-Job | Remove-Job -Force\r\nWrite-OutPut \"`nScript execution completed\"\r\n}\r\n\r\n <#\r\nparam (\r\n     \r\n    [Parameter(Mandatory = $true)]\r\n    [string]$TagName=\"maintainance\",\r\n \r\n    [Parameter(Mandatory = $true)]\r\n    [string]$TagValue=\"daily\"\r\n)#>\r\n \r\n $TagName=\"maintainance\"\r\n $TagValue=\"daily\"\r\n $resourceGroup = \"DefaultResourceGroup-CCAN\"\r\n\r\n# Connect to Azure (if not already connected)\r\n# Authenticate with Managed Identity\r\naz login\r\n\r\n# Parameters\r\n# $tagName = \"patch\"    # Specify your tag name\r\n# $tagValue = \"patch-001\"     # Specify your tag value\r\n$maxConcurrentJobs = 10    # Maximum number of concurrent jobs\r\n \r\n# Function to process VMs in a subscription\r\nfunction Process-VMs {\r\nparam (\r\n    [string]$SubscriptionId,\r\n    [string]$SubscriptionName\r\n)\r\n  az account set --subscription $SubscriptionId\r\n\r\n Set-AzContext -SubscriptionId $SubscriptionId\r\n \r\n Get-AzContext\r\nWrite-Host \"`nProcessing Subscription: $SubscriptionName ($SubscriptionId)\" -ForegroundColor Yellow\r\n \r\n# Get all VMs with the specified tag\r\n$vms = Get-AzVM | Where-Object {$_.Tags.Keys -contains $tagName -and $_.Tags[$tagName] -eq $tagValue}\r\n \r\nif ($vms.Count -eq 0) {\r\n    Write-Host \"No VMs found with tag $tagName = $tagValue in subscription $SubscriptionName\" -ForegroundColor Yellow\r\n    return\r\n}\r\n\r\n# Get all existing maintenance configurations in the RG\r\n$maintenanceConfigs = Get-AzMaintenanceConfiguration #-ResourceGroupName $resourceGroup\r\n\r\n foreach ($vm in $vms) {\r\n$vmName = $vm.Name\r\n    $tagValue = $vm.Tags[$tagName]\r\n    \r\n    Write-Host \" VM '$vmName' has tag $tagKey = '$tagValue'\"\r\n    \r\n    # Find matching maintenance configuration by name\r\n    $config = $maintenanceConfigs | Where-Object { $_.Name -eq $tagValue }\r\n    \r\n    if (-not $config) {\r\n        Write-Warning \" No maintenance configuration found with name '$tagValue'. Skipping VM '$vmName'\"\r\n        continue\r\n    }\r\n  \r\n    # Assign VM to maintenance configuration\r\n    $assignmentName = \"$vmName-$tagValue\"\r\n\r\n    Write-Host \" Assigning VM '$vmName' to maintenance config '$tagValue'\"\r\n   az maintenance assignment create   --resource-group $vm.ResourceGroupName   --location $vm.Location  --resource-name $vm.Name   --resource-type virtualMachines   --provider-name Microsoft.Compute   --configuration-assignment-name $($vm.Name)-$($config.Name)   --maintenance-configuration-id $config.Id \r\n}\r\n}\r\n \r\n# Main script\r\ntry {\r\n$subscriptions = Get-AzSubscription\r\n \r\nforeach ($sub in $subscriptions) {\r\n    Set-AzContext -SubscriptionId $sub.Id | Out-Null\r\n    Process-VMs -SubscriptionId $sub.Id -SubscriptionName $sub.Name\r\n}\r\n}\r\ncatch {\r\nWrite-Host \"Error: $_\" -ForegroundColor Red\r\n}\r\nfinally {\r\nGet-Job | Remove-Job -Force\r\nWrite-Host \"`nScript execution completed\" -ForegroundColor Green\r\n}\r\n "
  description             = "This is a runbook to start/stop VMs based on tags"
  location                = "northeurope"
  log_progress            = true
  log_verbose             = true
  name                    = "R-AUM-ATTACH-VM"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  runbook_type            = "PowerShell"
  tags = {
    "Account Type"    = "PLACEHOLDER"
    AppSupport        = "PLACEHOLDER"
    BusinessUnit      = "PLACEHOLDER"
    Confidentiality   = "PLACEHOLDER"
    CostCentre        = "FD2000"
    DataSensitivity   = "PLACEHOLDER"
    Description       = "PLACEHOLDER"
    InfraSupport      = "HCL-VIP-Support"
    Name              = "PLACEHOLDER"
    OperatingSystem   = "PLACEHOLDER"
    Owner             = "Daniel Dalla"
    PII               = "PLACEHOLDER"
    Project           = "PLACEHOLDER"
    ServerCriticality = "PLACEHOLDER"
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_runbook" "res-449" {
  automation_account_name = "R-CSSPZ-AA-MAN-PRD-001"
  content                 = "\r\nparam (\r\n    [Parameter(Mandatory = $true)]\r\n    [ValidateSet(\"Start\", \"Stop\")]\r\n    [string]$Action,\r\n\r\n    [Parameter(Mandatory = $true)]\r\n    [string]$TagName,\r\n\r\n    [Parameter(Mandatory = $true)]\r\n    [string]$TagValue\r\n)\r\n\r\n$allowedenv= @(\"DEV\", \"NPRD\", \"PP\", \"UAT\", \"SIT\", \"ST\", \"SANDBOX\")\r\n\r\n# Connect to Azure (if not already connected)\r\n# Authenticate with Managed Identity\r\nDisable-AzContextAutosave -Scope Process\r\nConnect-AzAccount -Identity\r\n\r\n# Parameters\r\n# $tagName = \"patch\"    # Specify your tag name\r\n# $tagValue = \"patch-001\"     # Specify your tag value\r\n$maxConcurrentJobs = 10    # Maximum number of concurrent jobs\r\n\r\n# Function to process VMs in a subscription\r\nfunction Process-VMs {\r\nparam (\r\n    [string]$SubscriptionId,\r\n    [string]$SubscriptionName\r\n)\r\n\r\nWrite-Host \"`nProcessing Subscription: $SubscriptionName ($SubscriptionId)\" -ForegroundColor Yellow\r\n\r\n# Get all VMs with the specified tag\r\n$vms = Get-AzVM | Where-Object {$_.Tags.Keys -contains $tagName -and $_.Tags[$tagName] -eq $tagValue}\r\n\r\nif ($vms.Count -eq 0) {\r\n    Write-Host \"No VMs found with tag $tagName = $tagValue in subscription $SubscriptionName\" -ForegroundColor Yellow\r\n    return\r\n}\r\n\r\n$jobs = @()\r\n\r\nforeach ($vm in $vms) {\r\n    # Wait if we've reached the maximum number of concurrent jobs\r\n    $envtag= $vm.Tags[\"Environment\"]\r\n    if($allowedenv  -contains $envtag)\r\n    {\r\n    while ((Get-Job -State Running).Count -ge $maxConcurrentJobs) {\r\n        Start-Sleep -Seconds 1\r\n        $completedJobs = Get-Job -State Completed\r\n        foreach ($job in $completedJobs) {\r\n            Receive-Job -Job $job\r\n            Remove-Job -Job $job\r\n        }\r\n    }\r\n    \r\n    # Start a new job for this VM\r\n    $jobs += Start-Job -ScriptBlock {\r\n        param($VM, $SubscriptionId)\r\n        Import-Module Az.Accounts\r\n        Import-Module Az.Compute\r\n        Disable-AzContextAutosave -Scope Process\r\n        Connect-AzAccount -Identity\r\n        # Set subscription context\r\n        Set-AzContext -SubscriptionId $SubscriptionId | Out-Null\r\n\r\n        Get the current status of the VM\r\n        $status = (Get-AzVM -ResourceGroupName $VM.ResourceGroupName -Name $VM.Name -Status).Statuses | \r\n                  Where-Object { $_.Code -match \"PowerState\" }\r\n        $powerState = $status.DisplayStatus\r\n        Write-Output \"VM: $($VM.Name) - Current Power State: $powerState\"\r\n\r\n        try {\r\n           if ($powerState -eq \"VM running\") {\r\n                Write-Output \"Stopping VM: $($VM.Name)\"\r\n                Stop-AzVM -ResourceGroupName $VM.ResourceGroupName -Name $VM.Name -Force\r\n                Write-Output \"VM $($VM.Name) stopped successfully\"\r\n            }\r\n             elseif ($powerState -eq \"VM deallocated\") {\r\n                Write-Output \"Starting VM: $($VM.Name)\"\r\n                Start-AzVM -ResourceGroupName $VM.ResourceGroupName -Name $VM.Name\r\n                Write-Output \"VM $($VM.Name) started successfully\"\r\n            }\r\n            else {\r\n                Write-Output \"VM $($VM.Name) is in transition state ($powerState). Skipping...\"\r\n            }\r\n        }\r\n        catch {\r\n            Write-Output \"Error processing VM $($VM.Name): $_\"\r\n        }\r\n    } -ArgumentList $vm, $SubscriptionId\r\n}\r\n}\r\n# Wait for remaining jobs to complete and process their output\r\nWrite-Host \"Waiting for remaining jobs to complete...\" -ForegroundColor Yellow\r\nWait-Job -Job $jobs | Out-Null\r\n\r\nforeach ($job in $jobs) {\r\n    Receive-Job -Job $job\r\n    Remove-Job -Job $job\r\n}\r\n}\r\n\r\n# Main script\r\ntry {\r\n$subscriptions = Get-AzSubscription\r\n\r\nforeach ($sub in $subscriptions) {\r\n    Set-AzContext -SubscriptionId $sub.Id | Out-Null\r\n    Process-VMs -SubscriptionId $sub.Id -SubscriptionName $sub.Name\r\n}\r\n}\r\ncatch {\r\nWrite-Host \"Error: $_\" -ForegroundColor Red\r\n}\r\nfinally {\r\nGet-Job | Remove-Job -Force\r\nWrite-Host \"`nScript execution completed\" -ForegroundColor Green\r\n}"
  description             = "This is a runbook to start/stop VMs based on tags"
  location                = "northeurope"
  log_progress            = true
  log_verbose             = true
  name                    = "R-VM-START-STOP"
  resource_group_name     = "m-csspz-rg-man-prd-003"
  runbook_type            = "PowerShell"
  tags = {
    "Account Type"    = "PLACEHOLDER"
    AppSupport        = "PLACEHOLDER"
    BusinessUnit      = "PLACEHOLDER"
    Confidentiality   = "PLACEHOLDER"
    CostCentre        = "FD2000"
    DataSensitivity   = "PLACEHOLDER"
    Description       = "PLACEHOLDER"
    InfraSupport      = "HCL-VIP-Support"
    Name              = "PLACEHOLDER"
    OperatingSystem   = "PLACEHOLDER"
    Owner             = "Daniel Dalla"
    PII               = "PLACEHOLDER"
    Project           = "PLACEHOLDER"
    ServerCriticality = "PLACEHOLDER"
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_managed_disk" "res-450" {
  create_option          = "FromImage"
  disk_encryption_set_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-004/providers/Microsoft.Compute/diskEncryptionSets/M-DES-MAN-PROD-001"
  hyper_v_generation     = "V1"
  image_reference_id     = "/Subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/Providers/Microsoft.Compute/Locations/northeurope/Publishers/audiocodes/ArtifactTypes/VMImage/Offers/audcovoc/Skus/acovoce4azure/Versions/8.4.3079"
  location               = "northeurope"
  name                   = "M-CSSPZ-OVOC-IMAGE_OsDisk_1_23e74f38e4c04fccaa56f89b7780dd34"
  os_type                = "Linux"
  resource_group_name    = "m-csspz-rg-man-prd-003"
  storage_account_type   = "Premium_LRS"
  tags = {
    "Account Type"            = "PLACEHOLDER"
    "App Support"             = "PLACEHOLDER"
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
    "Operational Status"      = "PLACEHOLDER"
    Owner                     = "Daniel Dalla"
    PII                       = "PLACEHOLDER"
    "Patch Group"             = "PLACEHOLDER"
    Project                   = "PLACEHOLDER"
    "Server Criticality"      = "PLACEHOLDER"
    ServerCriticality         = "PLACEHOLDER"
    "Support Groups"          = "PLACEHOLDER"
  }
  zone = "1"
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_windows_virtual_machine" "res-451" {
  admin_password        = "ignored-as-imported"
  admin_username        = "cyberarkadmin"
  location              = "northeurope"
  name                  = "M-CSSPZ-VM-CYBERARK-MAN-PRD-001"
  network_interface_ids = ["/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-003/providers/Microsoft.Network/networkInterfaces/m-csspz-vm-cyberark-man-prd-001315_z1"]
  resource_group_name   = "m-csspz-rg-man-prd-003"
  secure_boot_enabled   = true
  size                  = "Standard_D4s_v3"
  tags = {
    "Account Type"            = "CCoE Managed"
    "App Support"             = "PLACEHOLDER"
    AppSupport                = "PLACEHOLDER"
    "BOI Application"         = "PLACEHOLDER"
    "BOI Application Service" = "PLACEHOLDER"
    Backup                    = "Azure Backup"
    "Business Function"       = "PLACEHOLDER"
    "Business Unit"           = "PLACEHOLDER"
    BusinessFunction          = "CyberArk server"
    BusinessUnit              = "PLACEHOLDER"
    Compliance                = "PLACEHOLDER"
    Confidentiality           = "PLACEHOLDER"
    "Cost Centre"             = "PLACEHOLDER"
    CostCentre                = "PLACEHOLDER"
    "Data Sensitivity"        = "PLACEHOLDER"
    DataSensitivity           = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "Production"
    "Infra Support"           = "PLACEHOLDER"
    InfraSupport              = "PLACEHOLDER"
    "Log Level"               = "PLACEHOLDER"
    "Log Zone"                = "PLACEHOLDER"
    MaintWinPatch             = "PLACEHOLDER"
    MaintWinPatchScan         = "PLACEHOLDER"
    Name                      = "PLACEHOLDER"
    "Operating System"        = "PLACEHOLDER"
    OperatingSystem           = "Windows Server"
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
    SupportGroup              = "HCL-VIP-Support"
  }
  vtpm_enabled = true
  zone         = "1"
  additional_capabilities {
  }
  boot_diagnostics {
  }
  identity {
    type = "SystemAssigned"
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }
  source_image_reference {
    offer     = "WindowsServer"
    publisher = "MicrosoftWindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"
  }
  depends_on = [
    azurerm_network_interface.res-7,
  ]
}
resource "azurerm_virtual_machine_extension" "res-452" {
  auto_upgrade_minor_version = true
  name                       = "enablevmAccess"
  publisher                  = "Microsoft.Compute"
  settings = jsonencode({
    userName = "cyberarkadmin"
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
  type                 = "VMAccessAgent"
  type_handler_version = "2.0"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/m-csspz-rg-man-prd-003/providers/Microsoft.Compute/virtualMachines/M-CSSPZ-VM-CYBERARK-MAN-PRD-001"
  depends_on = [
    azurerm_windows_virtual_machine.res-451,
  ]
}
resource "azurerm_monitor_metric_alert" "res-453" {
  description         = "Metric Alert for Automation Account TotalJob Alert"
  name                = "R-CSSPZ-AA-MAN-PRD-001-TotalJob"
  resource_group_name = "m-csspz-rg-man-prd-003"
  scopes              = ["/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/m-csspz-rg-man-prd-003/providers/Microsoft.Automation/automationAccounts/R-CSSPZ-AA-MAN-PRD-001"]
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
    "Operational Status"      = "PLACEHOLDER"
    Owner                     = "Daniel Dalla"
    PII                       = "PLACEHOLDER"
    "Patch Group"             = "PLACEHOLDER"
    Project                   = "PLACEHOLDER"
    "Server Criticality"      = "PLACEHOLDER"
    ServerCriticality         = "PLACEHOLDER"
    "Support Groups"          = "PLACEHOLDER"
    _deployed_by_amba         = "True"
  }
  criteria {
    aggregation      = "Average"
    metric_name      = "TotalJob"
    metric_namespace = "Microsoft.Automation/automationAccounts"
    operator         = "GreaterThan"
    threshold        = 0
    dimension {
      name     = "Status"
      operator = "Exclude"
      values   = ["Completed"]
    }
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_maintenance_configuration" "res-454" {
  in_guest_user_patch_mode = "User"
  location                 = "northeurope"
  name                     = "Nightly-2am"
  resource_group_name      = "m-csspz-rg-man-prd-003"
  scope                    = "InGuestPatch"
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
  install_patches {
    reboot = "IfRequired"
    linux {
      classifications_to_include = ["Critical", "Security"]
    }
    windows {
      classifications_to_include = ["Critical", "Security"]
    }
  }
  window {
    duration        = "04:00"
    recur_every     = "1Day"
    start_date_time = "2025-07-03 02:00"
    time_zone       = "GMT Standard Time"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_maintenance_configuration" "res-455" {
  in_guest_user_patch_mode = "User"
  location                 = "northeurope"
  name                     = "Nightly-3am"
  resource_group_name      = "m-csspz-rg-man-prd-003"
  scope                    = "InGuestPatch"
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
    "Operational Status"      = "PLACEHOLDER"
    Owner                     = "Daniel Dalla"
    PII                       = "PLACEHOLDER"
    "Patch Group"             = "PLACEHOLDER"
    Project                   = "PLACEHOLDER"
    "Server Criticality"      = "PLACEHOLDER"
    ServerCriticality         = "PLACEHOLDER"
    "Support Groups"          = "PLACEHOLDER"
  }
  install_patches {
    reboot = "IfRequired"
    linux {
      classifications_to_include = ["Critical", "Security"]
    }
    windows {
      classifications_to_include = ["Critical", "Security"]
    }
  }
  window {
    duration        = "04:00"
    recur_every     = "1Day"
    start_date_time = "2025-07-03 03:00"
    time_zone       = "GMT Standard Time"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_maintenance_configuration" "res-456" {
  in_guest_user_patch_mode = "User"
  location                 = "northeurope"
  name                     = "PilotGrp1"
  resource_group_name      = "m-csspz-rg-man-prd-003"
  scope                    = "InGuestPatch"
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
  install_patches {
    reboot = "IfRequired"
    linux {
      classifications_to_include = ["Critical", "Security"]
    }
    windows {
      classifications_to_include = ["Critical", "Security"]
    }
  }
  window {
    duration        = "04:00"
    recur_every     = "Month First Tuesday"
    start_date_time = "2025-08-05 02:00"
    time_zone       = "GMT Standard Time"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_maintenance_configuration" "res-457" {
  in_guest_user_patch_mode = "User"
  location                 = "northeurope"
  name                     = "PilotGrp2"
  resource_group_name      = "m-csspz-rg-man-prd-003"
  scope                    = "InGuestPatch"
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
  install_patches {
    reboot = "IfRequired"
    linux {
      classifications_to_include = ["Critical", "Security"]
    }
    windows {
      classifications_to_include = ["Critical", "Security"]
    }
  }
  window {
    duration        = "04:00"
    recur_every     = "Month First Tuesday"
    start_date_time = "2025-08-05 03:00"
    time_zone       = "GMT Standard Time"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_maintenance_configuration" "res-458" {
  in_guest_user_patch_mode = "User"
  location                 = "northeurope"
  name                     = "PilotGrp3"
  resource_group_name      = "m-csspz-rg-man-prd-003"
  scope                    = "InGuestPatch"
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
  install_patches {
    reboot = "IfRequired"
    linux {
      classifications_to_include = ["Critical", "Security"]
    }
    windows {
      classifications_to_include = ["Critical", "Security"]
    }
  }
  window {
    duration        = "04:00"
    recur_every     = "Month First Tuesday"
    start_date_time = "2025-08-05 04:00"
    time_zone       = "GMT Standard Time"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_maintenance_configuration" "res-459" {
  in_guest_user_patch_mode = "User"
  location                 = "northeurope"
  name                     = "PrepGrp1"
  resource_group_name      = "m-csspz-rg-man-prd-003"
  scope                    = "InGuestPatch"
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
    "Operational Status"      = "PLACEHOLDER"
    Owner                     = "Daniel Dalla"
    PII                       = "PLACEHOLDER"
    "Patch Group"             = "PLACEHOLDER"
    Project                   = "PLACEHOLDER"
    "Server Criticality"      = "PLACEHOLDER"
    ServerCriticality         = "PLACEHOLDER"
    "Support Groups"          = "PLACEHOLDER"
  }
  install_patches {
    reboot = "IfRequired"
    linux {
      classifications_to_include = ["Critical", "Security"]
    }
    windows {
      classifications_to_include = ["Critical", "Security"]
    }
  }
  window {
    duration        = "04:00"
    recur_every     = "Month Third Tuesday"
    start_date_time = "2025-07-15 02:00"
    time_zone       = "GMT Standard Time"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_maintenance_configuration" "res-460" {
  in_guest_user_patch_mode = "User"
  location                 = "northeurope"
  name                     = "PrepGrp2"
  resource_group_name      = "m-csspz-rg-man-prd-003"
  scope                    = "InGuestPatch"
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
  install_patches {
    reboot = "IfRequired"
    linux {
      classifications_to_include = ["Critical", "Security"]
    }
    windows {
      classifications_to_include = ["Critical", "Security"]
    }
  }
  window {
    duration        = "04:00"
    recur_every     = "Month Third Wednesday"
    start_date_time = "2025-07-16 02:00"
    time_zone       = "GMT Standard Time"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_maintenance_configuration" "res-461" {
  in_guest_user_patch_mode = "User"
  location                 = "northeurope"
  name                     = "PrepGrp3"
  resource_group_name      = "m-csspz-rg-man-prd-003"
  scope                    = "InGuestPatch"
  tags = {
    "Account Type"            = "PLACEHOLDER"
    "App Support"             = "PLACEHOLDER"
    AppSupport                = "PLACEHOLDER"
    "BOI Application"         = "PLACEHOLDER"
    "BOI Application Service" = "PLACEHOLDER"
    Backup                    = "PLACEHOLDER"
    "Business Function"       = "PLACEHOLDER"
    "Business Unit"           = "PLACEHOLDER"
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
  install_patches {
    reboot = "IfRequired"
    linux {
      classifications_to_include = ["Critical", "Security"]
    }
    windows {
      classifications_to_include = ["Critical", "Security"]
    }
  }
  window {
    duration        = "04:00"
    recur_every     = "Month Third Thursday"
    start_date_time = "2025-07-17 02:00"
    time_zone       = "GMT Standard Time"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_maintenance_configuration" "res-462" {
  in_guest_user_patch_mode = "User"
  location                 = "northeurope"
  name                     = "ProdGrp1"
  resource_group_name      = "m-csspz-rg-man-prd-003"
  scope                    = "InGuestPatch"
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
    "Operational Status"      = "PLACEHOLDER"
    Owner                     = "Daniel Dalla"
    PII                       = "PLACEHOLDER"
    "Patch Group"             = "PLACEHOLDER"
    Project                   = "PLACEHOLDER"
    "Server Criticality"      = "PLACEHOLDER"
    ServerCriticality         = "PLACEHOLDER"
    "Support Groups"          = "PLACEHOLDER"
  }
  install_patches {
    reboot = "IfRequired"
    linux {
      classifications_to_include = ["Critical", "Security"]
    }
    windows {
      classifications_to_include = ["Critical", "Security"]
    }
  }
  window {
    duration        = "04:00"
    recur_every     = "Month Fourth Tuesday"
    start_date_time = "2025-07-22 02:00"
    time_zone       = "GMT Standard Time"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_maintenance_configuration" "res-463" {
  in_guest_user_patch_mode = "User"
  location                 = "northeurope"
  name                     = "ProdGrp2"
  resource_group_name      = "m-csspz-rg-man-prd-003"
  scope                    = "InGuestPatch"
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
    InfraSupport              = "HCL-VIP-Support"
    "Log Level"               = "PLACEHOLDER"
    "Log Zone"                = "PLACEHOLDER"
    MaintWinPatch             = "PLACEHOLDER"
    MaintWinPatchScan         = "PLACEHOLDER"
    Name                      = "PLACEHOLDER"
    "Operating System"        = "PLACEHOLDER"
    "Operational Status"      = "PLACEHOLDER"
    Owner                     = "Daniel Dalla"
    PII                       = "PLACEHOLDER"
    "Patch Group"             = "PLACEHOLDER"
    Project                   = "PLACEHOLDER"
    "Server Criticality"      = "PLACEHOLDER"
    ServerCriticality         = "PLACEHOLDER"
    "Support Groups"          = "PLACEHOLDER"
  }
  install_patches {
    reboot = "IfRequired"
    linux {
      classifications_to_include = ["Critical", "Security"]
    }
    windows {
      classifications_to_include = ["Critical", "Security"]
    }
  }
  window {
    duration        = "04:00"
    recur_every     = "Month Fourth Wednesday"
    start_date_time = "2025-07-23 02:00"
    time_zone       = "GMT Standard Time"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_maintenance_configuration" "res-464" {
  in_guest_user_patch_mode = "User"
  location                 = "northeurope"
  name                     = "ProdGrp3"
  resource_group_name      = "m-csspz-rg-man-prd-003"
  scope                    = "InGuestPatch"
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
    InfraSupport              = "HCL-VIP-Support"
    "Log Level"               = "PLACEHOLDER"
    "Log Zone"                = "PLACEHOLDER"
    MaintWinPatch             = "PLACEHOLDER"
    MaintWinPatchScan         = "PLACEHOLDER"
    Name                      = "PLACEHOLDER"
    "Operating System"        = "PLACEHOLDER"
    "Operational Status"      = "PLACEHOLDER"
    Owner                     = "Daniel Dalla"
    PII                       = "PLACEHOLDER"
    "Patch Group"             = "PLACEHOLDER"
    Project                   = "PLACEHOLDER"
    "Server Criticality"      = "PLACEHOLDER"
    ServerCriticality         = "PLACEHOLDER"
    "Support Groups"          = "PLACEHOLDER"
  }
  install_patches {
    reboot = "IfRequired"
    linux {
      classifications_to_include = ["Critical", "Security"]
    }
    windows {
      classifications_to_include = ["Critical", "Security"]
    }
  }
  window {
    duration        = "04:00"
    recur_every     = "Month Fourth Thursday"
    start_date_time = "2025-07-24 02:00"
    time_zone       = "GMT Standard Time"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_maintenance_configuration" "res-465" {
  in_guest_user_patch_mode = "User"
  location                 = "northeurope"
  name                     = "TestGrp1"
  resource_group_name      = "m-csspz-rg-man-prd-003"
  scope                    = "InGuestPatch"
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
  install_patches {
    reboot = "IfRequired"
    linux {
      classifications_to_include = ["Critical", "Security"]
    }
    windows {
      classifications_to_include = ["Critical", "Security"]
    }
  }
  window {
    duration        = "04:00"
    recur_every     = "Month Second Tuesday"
    start_date_time = "2025-07-08 02:00"
    time_zone       = "GMT Standard Time"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_maintenance_configuration" "res-466" {
  in_guest_user_patch_mode = "User"
  location                 = "northeurope"
  name                     = "TestGrp2"
  resource_group_name      = "m-csspz-rg-man-prd-003"
  scope                    = "InGuestPatch"
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
  install_patches {
    reboot = "IfRequired"
    linux {
      classifications_to_include = ["Critical", "Security"]
    }
    windows {
      classifications_to_include = ["Critical", "Security"]
    }
  }
  window {
    duration        = "04:00"
    recur_every     = "Month Second Tuesday"
    start_date_time = "2025-07-08 03:00"
    time_zone       = "GMT Standard Time"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_maintenance_configuration" "res-467" {
  in_guest_user_patch_mode = "User"
  location                 = "northeurope"
  name                     = "TestGrp3"
  resource_group_name      = "m-csspz-rg-man-prd-003"
  scope                    = "InGuestPatch"
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
  install_patches {
    reboot = "IfRequired"
    linux {
      classifications_to_include = ["Critical", "Security"]
    }
    windows {
      classifications_to_include = ["Critical", "Security"]
    }
  }
  window {
    duration        = "04:00"
    recur_every     = "Month Second Tuesday"
    start_date_time = "2025-07-08 04:00"
    time_zone       = "GMT Standard Time"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_virtual_machine_extension" "res-468" {
  auto_upgrade_minor_version = true
  name                       = "AzureMonitorWindowsAgent"
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
  type                 = "AzureMonitorWindowsAgent"
  type_handler_version = "1.0"
  virtual_machine_id   = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/m-csspz-rg-man-prd-003/providers/Microsoft.Compute/virtualMachines/M-CSSPZ-VM-CYBERARK-MAN-PRD-001"
  depends_on = [
    azurerm_windows_virtual_machine.res-451,
  ]
}
