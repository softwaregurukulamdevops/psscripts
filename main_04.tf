resource "azurerm_monitor_action_group" "res-0" {
  name                = "syslog-email-alert"
  resource_group_name = "R-CSSPZ-RG-MAN-PRD-004"
  short_name          = "syslog-email"
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
  email_receiver {
    email_address = "AWSVIP_IGW_Team@boi.com"
    name          = "email-alert_-EmailAction-"
  }
  depends_on = [
    azurerm_resource_group.res-1,
  ]
}
resource "azurerm_resource_group" "res-1" {
  location = "northeurope"
  name     = "R-CSSPZ-RG-MAN-PRD-004"
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
resource "azurerm_network_security_group" "res-2" {
  location            = "northeurope"
  name                = "basicNsgM-CSSPZ-VNET-MAN-PRD-001-nic01"
  resource_group_name = "R-CSSPZ-RG-MAN-PRD-004"
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
    azurerm_resource_group.res-1,
  ]
}
resource "azurerm_monitor_activity_log_alert" "res-3" {
  description         = "This alert will monitor vm health."
  name                = "Syslog failing instance status check"
  resource_group_name = "R-CSSPZ-RG-MAN-PRD-004"
  scopes              = ["/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11"]
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
    action_group_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourcegroups/r-csspz-rg-man-prd-004/providers/microsoft.insights/actiongroups/syslog-email-alert"
  }
  criteria {
    category        = "ResourceHealth"
    resource_groups = ["r-csspz-rg-man-prd-004"]
    resource_ids    = ["/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-004/providers/Microsoft.Compute/virtualMachines/RZSYSLGMANPRD01", "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-004/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-SYSLG-MAN-PRD-001"]
    resource_types  = ["Microsoft.Compute/virtualMachines"]
  }
  depends_on = [
    azurerm_resource_group.res-1,
  ]
}
resource "azurerm_monitor_metric_alert" "res-4" {
  description         = "Syslog Prod VM Avaiable Memory is Less than 3GB"
  name                = "Syslog Prod VM Avaiable Memory Alert"
  resource_group_name = "R-CSSPZ-RG-MAN-PRD-004"
  scopes              = ["/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-004/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-SYSLG-MAN-PRD-001", "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-004/providers/Microsoft.Compute/virtualMachines/RZSYSLGMANPRD01"]
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
    action_group_id = "/subscriptions/6088F278-2D38-4BDD-9E08-E5417D44AF11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/microsoft.insights/actionGroups/VIPSupport"
    webhook_properties = {
      AssignmentGroup = "HCL-VIP-Support"
      Service         = "Azure Landing Zone Application Service"
      SubType         = "VM Available Memory Alert"
      Type            = "Performance"
    }
  }
  action {
    action_group_id = "/subscriptions/B97DA650-B444-4530-9F4B-968706A96E1B/resourceGroups/M-CSSPZ-RG-SOC-PRD-001/providers/microsoft.insights/actionGroups/ServiceNow Azure Monitor Sync"
    webhook_properties = {
      AssignmentGroup = "HCL-VIP-Support"
      Service         = "Azure Landing Zone Application Service"
      SubType         = "VM Available Memory Alert"
      Type            = "Performance"
    }
  }
  criteria {
    aggregation      = "Average"
    metric_name      = "Available Memory Bytes"
    metric_namespace = "Microsoft.Compute/virtualMachines"
    operator         = "LessThan"
    threshold        = 3000000000
  }
  depends_on = [
    azurerm_resource_group.res-1,
  ]
}
resource "azurerm_monitor_metric_alert" "res-5" {
  description         = "Syslog Server CPU Usage is Above 80%"
  name                = "Syslog Server CPU Usage Alert"
  resource_group_name = "R-CSSPZ-RG-MAN-PRD-004"
  scopes              = ["/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-004/providers/Microsoft.Compute/virtualMachines/R-CSSPZ-VM-SYSLG-MAN-PRD-001", "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-004/providers/Microsoft.Compute/virtualMachines/RZSYSLGMANPRD01"]
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
    action_group_id = "/subscriptions/B97DA650-B444-4530-9F4B-968706A96E1B/resourceGroups/M-CSSPZ-RG-SOC-PRD-001/providers/microsoft.insights/actionGroups/ServiceNow Azure Monitor Sync"
    webhook_properties = {
      AssignmentGroup = "HCL-VIP-Support"
      Service         = "Azure Landing Zone Application Service"
      SubType         = "VM CPU Usage Alert"
      Type            = "Performance"
    }
  }
  criteria {
    aggregation      = "Average"
    metric_name      = "Percentage CPU"
    metric_namespace = "Microsoft.Compute/virtualMachines"
    operator         = "GreaterThan"
    threshold        = 80
  }
  depends_on = [
    azurerm_resource_group.res-1,
  ]
}
resource "azurerm_snapshot" "res-6" {
  create_option       = "Copy"
  location            = "northeurope"
  name                = "RZSYSLGMANPRD01_OS_SNAPSHOT_20221024_No_Vulnerabilities"
  resource_group_name = "r-csspz-rg-man-prd-004"
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
    azurerm_resource_group.res-1,
  ]
}
