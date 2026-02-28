resource "azurerm_resource_group" "res-0" {
  location = "northeurope"
  name     = "M-CSSPZ-RG-MAN-PRD-002"
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
resource "azurerm_monitor_data_collection_rule" "res-1" {
  description         = "Data collection rule for VM Insights."
  location            = "northeurope"
  name                = "MSVMI-DefaultWorkspace-6088f278-2d38-4bdd-9e08-e5417d44af11-EUS"
  resource_group_name = "M-CSSPZ-RG-MAN-PRD-002"
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
  data_flow {
    destinations = ["VMInsightsPerf-Logs-Dest"]
    streams      = ["Microsoft-InsightsMetrics"]
  }
  data_sources {
    performance_counter {
      counter_specifiers            = ["\\VmInsights\\DetailedMetrics"]
      name                          = "VMInsightsPerfCounters"
      sampling_frequency_in_seconds = 60
      streams                       = ["Microsoft-InsightsMetrics"]
    }
  }
  destinations {
    log_analytics {
      name                  = "VMInsightsPerf-Logs-Dest"
      workspace_resource_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
    }
  }
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_monitor_data_collection_rule" "res-2" {
  description         = "Windows data collection rule"
  location            = "northeurope"
  name                = "R-CSSPZ-DCR-MAN-PRD-001"
  resource_group_name = "M-CSSPZ-RG-MAN-PRD-002"
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
  data_flow {
    destinations = ["R-CSSPZ-LOGS-MAN-PRD-001"]
    streams      = ["Microsoft-Event"]
  }
  data_sources {
    windows_event_log {
      name           = "R-CSSPZ-DCR-MAN-PRD-001-eventlog"
      streams        = ["Microsoft-Event"]
      x_path_queries = ["Application!*[System[(Level=1 or Level=2 or Level=3)]]", "Security!*[System[(band(Keywords,4503599627370496))]]", "System!*[System[(Level=1 or Level=2 or Level=3)]]"]
    }
  }
  destinations {
    azure_monitor_metrics {
      name = "R-CSSPZ-DCR-MAN-PRD-001-metrics"
    }
    log_analytics {
      name                  = "R-CSSPZ-LOGS-MAN-PRD-001"
      workspace_resource_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
    }
  }
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_monitor_data_collection_rule" "res-3" {
  description         = "Linux data collection rule"
  location            = "northeurope"
  name                = "R-CSSPZ-DCR-MAN-PRD-002"
  resource_group_name = "M-CSSPZ-RG-MAN-PRD-002"
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
  data_flow {
    destinations = ["R-CSSPZ-LOGS-MAN-PRD-001"]
    streams      = ["Microsoft-Syslog"]
  }
  data_sources {
    syslog {
      facility_names = ["auth", "authpriv", "cron", "daemon", "mark", "kern", "local0", "local1", "local2", "local3", "local4", "local5", "local6", "local7", "lpr", "mail", "news", "syslog", "user", "uucp"]
      log_levels     = ["Warning", "Error", "Critical", "Alert", "Emergency"]
      name           = "R-CSSPZ-DCR-MAN-PRD-002-syslog"
    }
  }
  destinations {
    azure_monitor_metrics {
      name = "R-CSSPZ-DCR-MAN-PRD-002-metrics"
    }
    log_analytics {
      name                  = "R-CSSPZ-LOGS-MAN-PRD-001"
      workspace_resource_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
    }
  }
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_user_assigned_identity" "res-4" {
  location            = "northeurope"
  name                = "ADgroupmember"
  resource_group_name = "M-CSSPZ-RG-MAN-PRD-002"
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
resource "azurerm_log_analytics_workspace" "res-5" {
  location            = "northeurope"
  name                = "R-CSSPZ-LOGS-MAN-PRD-001"
  resource_group_name = "M-CSSPZ-RG-MAN-PRD-002"
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
resource "azurerm_log_analytics_linked_service" "res-6" {
  read_access_id      = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-001/providers/Microsoft.Automation/automationAccounts/aut-azure-servicenow-001"
  resource_group_name = "M-CSSPZ-RG-MAN-PRD-002"
  workspace_id        = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-7" {
  category                   = "Change Tracking"
  display_name               = "All Configuration Changes"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "ChangeTracking(R-CSSPZ-LOGS-MAN-PRD-001)_AllChanges"
  query                      = "search in (ConfigurationChange) * | sort by TimeGenerated desc // Oql: Type=ConfigurationChange "
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-8" {
  category                   = "Change Tracking"
  display_name               = "Change Type<Software> per Computer"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "ChangeTracking(R-CSSPZ-LOGS-MAN-PRD-001)_ChangeTypePerComputer"
  query                      = "search in (ConfigurationChange) ConfigChangeType == \"Software\" | summarize AggregatedValue = count() by Computer | limit 500000 // Oql: Type=ConfigurationChange ConfigChangeType=Software | Measure count() by Computer  | top 500000"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-9" {
  category                   = "Change Tracking"
  display_name               = "All Windows Services Changes"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "ChangeTracking(R-CSSPZ-LOGS-MAN-PRD-001)_ServiceChanges"
  query                      = "search in (ConfigurationChange) ConfigChangeType == \"WindowsServices\" | sort by TimeGenerated desc // Oql: Type=ConfigurationChange ConfigChangeType=WindowsServices"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-10" {
  category                   = "Change Tracking"
  display_name               = "Count of different Software change types"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "ChangeTracking(R-CSSPZ-LOGS-MAN-PRD-001)_SoftwareChangeCount"
  query                      = "search in (ConfigurationChange) ConfigChangeType == \"Software\" | summarize AggregatedValue = count() by ChangeCategory // Oql: Type=ConfigurationChange ConfigChangeType=Software | measure count() by ChangeCategory"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-11" {
  category                   = "Change Tracking"
  display_name               = "All Software Changes"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "ChangeTracking(R-CSSPZ-LOGS-MAN-PRD-001)_SoftwareChanges"
  query                      = "search in (ConfigurationChange) ConfigChangeType == \"Software\" | sort by TimeGenerated desc // Oql: Type=ConfigurationChange ConfigChangeType=Software"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-12" {
  category                   = "Change Tracking"
  display_name               = "List of all Windows Services that have been stopped"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "ChangeTracking(R-CSSPZ-LOGS-MAN-PRD-001)_StoppedServices"
  query                      = "search in (ConfigurationChange) ConfigChangeType == \"WindowsServices\" and SvcState == \"Stopped\" | sort by TimeGenerated desc // Oql: Type=ConfigurationChange ConfigChangeType=WindowsServices SvcState=Stopped"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-13" {
  category                   = "General Exploration"
  display_name               = "All Computers with their most recent data"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-001)_General|AlphabeticallySortedComputers"
  query                      = "search not(ObjectName == \"Advisor Metrics\" or ObjectName == \"ManagedSpace\") | summarize AggregatedValue = max(TimeGenerated) by Computer | limit 500000 | sort by Computer asc\r\n// Oql: NOT(ObjectName=\"Advisor Metrics\" OR ObjectName=ManagedSpace) | measure max(TimeGenerated) by Computer | top 500000 | Sort Computer // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-14" {
  category                   = "General Exploration"
  display_name               = "Stale Computers (data older than 24 hours)"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-001)_General|StaleComputers"
  query                      = "search not(ObjectName == \"Advisor Metrics\" or ObjectName == \"ManagedSpace\") | summarize lastdata = max(TimeGenerated) by Computer | limit 500000 | where lastdata < ago(24h)\r\n// Oql: NOT(ObjectName=\"Advisor Metrics\" OR ObjectName=ManagedSpace) | measure max(TimeGenerated) as lastdata by Computer | top 500000 | where lastdata < NOW-24HOURS // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-15" {
  category                   = "General Exploration"
  display_name               = "Which Management Group is generating the most data points?"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-001)_General|dataPointsPerManagementGroup"
  query                      = "search * | summarize AggregatedValue = count() by ManagementGroupName\r\n// Oql: * | Measure count() by ManagementGroupName // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-16" {
  category                   = "General Exploration"
  display_name               = "Distribution of data Types"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-001)_General|dataTypeDistribution"
  query                      = "search * | extend Type = $table | summarize AggregatedValue = count() by Type\r\n// Oql: * | Measure count() by Type // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-17" {
  category                   = "Log Management"
  display_name               = "All Events"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-001)_LogManagement|AllEvents"
  query                      = "Event | sort by TimeGenerated desc\r\n// Oql: Type=Event // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-18" {
  category                   = "Log Management"
  display_name               = "All Syslogs"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-001)_LogManagement|AllSyslog"
  query                      = "Syslog | sort by TimeGenerated desc\r\n// Oql: Type=Syslog // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-19" {
  category                   = "Log Management"
  display_name               = "All Syslog Records grouped by Facility"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-001)_LogManagement|AllSyslogByFacility"
  query                      = "Syslog | summarize AggregatedValue = count() by Facility\r\n// Oql: Type=Syslog | Measure count() by Facility // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-20" {
  category                   = "Log Management"
  display_name               = "All Syslog Records grouped by ProcessName"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-001)_LogManagement|AllSyslogByProcessName"
  query                      = "Syslog | summarize AggregatedValue = count() by ProcessName\r\n// Oql: Type=Syslog | Measure count() by ProcessName // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-21" {
  category                   = "Log Management"
  display_name               = "All Syslog Records with Errors"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-001)_LogManagement|AllSyslogsWithErrors"
  query                      = "Syslog | where SeverityLevel == \"error\" | sort by TimeGenerated desc\r\n// Oql: Type=Syslog SeverityLevel=error // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-22" {
  category                   = "Log Management"
  display_name               = "Average HTTP Request time by Client IP Address"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-001)_LogManagement|AverageHTTPRequestTimeByClientIPAddress"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = avg(TimeTaken) by cIP\r\n// Oql: Type=W3CIISLog | Measure Avg(TimeTaken) by cIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-23" {
  category                   = "Log Management"
  display_name               = "Average HTTP Request time by HTTP Method"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-001)_LogManagement|AverageHTTPRequestTimeHTTPMethod"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = avg(TimeTaken) by csMethod\r\n// Oql: Type=W3CIISLog | Measure Avg(TimeTaken) by csMethod // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-24" {
  category                   = "Log Management"
  display_name               = "Count of IIS Log Entries by Client IP Address"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-001)_LogManagement|CountIISLogEntriesClientIPAddress"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by cIP\r\n// Oql: Type=W3CIISLog | Measure count() by cIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-25" {
  category                   = "Log Management"
  display_name               = "Count of IIS Log Entries by HTTP Request Method"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-001)_LogManagement|CountIISLogEntriesHTTPRequestMethod"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csMethod\r\n// Oql: Type=W3CIISLog | Measure count() by csMethod // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-26" {
  category                   = "Log Management"
  display_name               = "Count of IIS Log Entries by HTTP User Agent"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-001)_LogManagement|CountIISLogEntriesHTTPUserAgent"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csUserAgent\r\n// Oql: Type=W3CIISLog | Measure count() by csUserAgent // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-27" {
  category                   = "Log Management"
  display_name               = "Count of IIS Log Entries by Host requested by client"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-001)_LogManagement|CountOfIISLogEntriesByHostRequestedByClient"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csHost\r\n// Oql: Type=W3CIISLog | Measure count() by csHost // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-28" {
  category                   = "Log Management"
  display_name               = "Count of IIS Log Entries by URL for the host \"www.contoso.com\" (replace with your own)"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-001)_LogManagement|CountOfIISLogEntriesByURLForHost"
  query                      = "search csHost == \"www.contoso.com\" | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csUriStem\r\n// Oql: Type=W3CIISLog csHost=\"www.contoso.com\" | Measure count() by csUriStem // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-29" {
  category                   = "Log Management"
  display_name               = "Count of IIS Log Entries by URL requested by client (without query strings)"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-001)_LogManagement|CountOfIISLogEntriesByURLRequestedByClient"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csUriStem\r\n// Oql: Type=W3CIISLog | Measure count() by csUriStem // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-30" {
  category                   = "Log Management"
  display_name               = "Count of Events with level \"Warning\" grouped by Event ID"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-001)_LogManagement|CountOfWarningEvents"
  query                      = "Event | where EventLevelName == \"warning\" | summarize AggregatedValue = count() by EventID\r\n// Oql: Type=Event EventLevelName=warning | Measure count() by EventID // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-31" {
  category                   = "Log Management"
  display_name               = "Shows breakdown of response codes"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-001)_LogManagement|DisplayBreakdownRespondCodes"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by scStatus\r\n// Oql: Type=W3CIISLog | Measure count() by scStatus // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-32" {
  category                   = "Log Management"
  display_name               = "Count of Events grouped by Event Log"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-001)_LogManagement|EventsByEventLog"
  query                      = "Event | summarize AggregatedValue = count() by EventLog\r\n// Oql: Type=Event | Measure count() by EventLog // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-33" {
  category                   = "Log Management"
  display_name               = "Count of Events grouped by Event Source"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-001)_LogManagement|EventsByEventSource"
  query                      = "Event | summarize AggregatedValue = count() by Source\r\n// Oql: Type=Event | Measure count() by Source // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-34" {
  category                   = "Log Management"
  display_name               = "Count of Events grouped by Event ID"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-001)_LogManagement|EventsByEventsID"
  query                      = "Event | summarize AggregatedValue = count() by EventID\r\n// Oql: Type=Event | Measure count() by EventID // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-35" {
  category                   = "Log Management"
  display_name               = "Events in the Operations Manager Event Log whose Event ID is in the range between 2000 and 3000"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-001)_LogManagement|EventsInOMBetween2000to3000"
  query                      = "Event | where EventLog == \"Operations Manager\" and EventID >= 2000 and EventID <= 3000 | sort by TimeGenerated desc\r\n// Oql: Type=Event EventLog=\"Operations Manager\" EventID:[2000..3000] // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-36" {
  category                   = "Log Management"
  display_name               = "Count of Events containing the word \"started\" grouped by EventID"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-001)_LogManagement|EventsWithStartedinEventID"
  query                      = "search in (Event) \"started\" | summarize AggregatedValue = count() by EventID\r\n// Oql: Type=Event \"started\" | Measure count() by EventID // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-37" {
  category                   = "Log Management"
  display_name               = "Find the maximum time taken for each page"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-001)_LogManagement|FindMaximumTimeTakenForEachPage"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = max(TimeTaken) by csUriStem\r\n// Oql: Type=W3CIISLog | Measure Max(TimeTaken) by csUriStem // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-38" {
  category                   = "Log Management"
  display_name               = "IIS Log Entries for a specific client IP Address (replace with your own)"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-001)_LogManagement|IISLogEntriesForClientIP"
  query                      = "search cIP == \"192.168.0.1\" | extend Type = $table | where Type == W3CIISLog | sort by TimeGenerated desc | project csUriStem, scBytes, csBytes, TimeTaken, scStatus\r\n// Oql: Type=W3CIISLog cIP=\"192.168.0.1\" | Select csUriStem,scBytes,csBytes,TimeTaken,scStatus // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-39" {
  category                   = "Log Management"
  display_name               = "All IIS Log Entries"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-001)_LogManagement|ListAllIISLogEntries"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | sort by TimeGenerated desc\r\n// Oql: Type=W3CIISLog // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-40" {
  category                   = "Log Management"
  display_name               = "How many connections to Operations Manager's SDK service by day"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-001)_LogManagement|NoOfConnectionsToOMSDKService"
  query                      = "Event | where EventID == 26328 and EventLog == \"Operations Manager\" | summarize AggregatedValue = count() by bin(TimeGenerated, 1d) | sort by TimeGenerated desc\r\n// Oql: Type=Event EventID=26328 EventLog=\"Operations Manager\" | Measure count() interval 1DAY // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-41" {
  category                   = "Log Management"
  display_name               = "When did my servers initiate restart?"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-001)_LogManagement|ServerRestartTime"
  query                      = "search in (Event) \"shutdown\" and EventLog == \"System\" and Source == \"User32\" and EventID == 1074 | sort by TimeGenerated desc | project TimeGenerated, Computer\r\n// Oql: shutdown Type=Event EventLog=System Source=User32 EventID=1074 | Select TimeGenerated,Computer // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-42" {
  category                   = "Log Management"
  display_name               = "Shows which pages people are getting a 404 for"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-001)_LogManagement|Show404PagesList"
  query                      = "search scStatus == 404 | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csUriStem\r\n// Oql: Type=W3CIISLog scStatus=404 | Measure count() by csUriStem // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-43" {
  category                   = "Log Management"
  display_name               = "Shows servers that are throwing internal server error"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-001)_LogManagement|ShowServersThrowingInternalServerError"
  query                      = "search scStatus == 500 | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by sComputerName\r\n// Oql: Type=W3CIISLog scStatus=500 | Measure count() by sComputerName // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-44" {
  category                   = "Log Management"
  display_name               = "Total Bytes received by each Azure Role Instance"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-001)_LogManagement|TotalBytesReceivedByEachAzureRoleInstance"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(csBytes) by RoleInstance\r\n// Oql: Type=W3CIISLog | Measure Sum(csBytes) by RoleInstance // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-45" {
  category                   = "Log Management"
  display_name               = "Total Bytes received by each IIS Computer"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-001)_LogManagement|TotalBytesReceivedByEachIISComputer"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(csBytes) by Computer | limit 500000\r\n// Oql: Type=W3CIISLog | Measure Sum(csBytes) by Computer | top 500000 // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-46" {
  category                   = "Log Management"
  display_name               = "Total Bytes responded back to clients by Client IP Address"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-001)_LogManagement|TotalBytesRespondedToClientsByClientIPAddress"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(scBytes) by cIP\r\n// Oql: Type=W3CIISLog | Measure Sum(scBytes) by cIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-47" {
  category                   = "Log Management"
  display_name               = "Total Bytes responded back to clients by each IIS ServerIP Address"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-001)_LogManagement|TotalBytesRespondedToClientsByEachIISServerIPAddress"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(scBytes) by sIP\r\n// Oql: Type=W3CIISLog | Measure Sum(scBytes) by sIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-48" {
  category                   = "Log Management"
  display_name               = "Total Bytes sent by Client IP Address"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-001)_LogManagement|TotalBytesSentByClientIPAddress"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(csBytes) by cIP\r\n// Oql: Type=W3CIISLog | Measure Sum(csBytes) by cIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-49" {
  category                   = "Log Management"
  display_name               = "All Events with level \"Warning\""
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-001)_LogManagement|WarningEvents"
  query                      = "Event | where EventLevelName == \"warning\" | sort by TimeGenerated desc\r\n// Oql: Type=Event EventLevelName=warning // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-50" {
  category                   = "Log Management"
  display_name               = "Windows Firewall Policy settings have changed"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-001)_LogManagement|WindowsFireawallPolicySettingsChanged"
  query                      = "Event | where EventLog == \"Microsoft-Windows-Windows Firewall With Advanced Security/Firewall\" and EventID == 2008 | sort by TimeGenerated desc\r\n// Oql: Type=Event EventLog=\"Microsoft-Windows-Windows Firewall With Advanced Security/Firewall\" EventID=2008 // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-51" {
  category                   = "Log Management"
  display_name               = "On which machines and how many times have Windows Firewall Policy settings changed"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-001)_LogManagement|WindowsFireawallPolicySettingsChangedByMachines"
  query                      = "Event | where EventLog == \"Microsoft-Windows-Windows Firewall With Advanced Security/Firewall\" and EventID == 2008 | summarize AggregatedValue = count() by Computer | limit 500000\r\n// Oql: Type=Event EventLog=\"Microsoft-Windows-Windows Firewall With Advanced Security/Firewall\" EventID=2008 | measure count() by Computer | top 500000 // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-52" {
  category                   = "Security"
  display_name               = "Accounts who terminated Microsoft antimalware (\"MsMpEng.exe\") on any computer"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_AccountsWhoTerminatedMicrosoftAntimalware"
  query                      = "search in (SecurityEvent) EventID == 4689 and \"MsMpEng.exe\" | summarize TerminationCount = count() by Account"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-53" {
  category                   = "Security"
  display_name               = "All Security Activities"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_AllSecurityActivities"
  query                      = "search in (SecurityEvent) * | project TimeGenerated, Account, Activity, Computer | sort by TimeGenerated desc"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-54" {
  category                   = "Security"
  display_name               = "Computers where \"hash.exe\" was executed (replace with different process name) more than 5 times"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_DevicesWhereHashWasExecuted"
  query                      = "search in (SecurityEvent) EventID == 4688 and \"hash.exe\" | summarize ExecutionCount = count() by Computer | limit 500000 | where ExecutionCount > 5"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-55" {
  category                   = "Security"
  display_name               = "Computers where the Microsoft antimalware process (\"MsMpEng.exe\") was terminated"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_DevicesWhereTheMicrosoftAntimalwareProcessTerminated"
  query                      = "search in (SecurityEvent) EventID == 4689 and \"MsMpEng.exe\" | summarize TerminationCount = count() by Computer | limit 500000"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-56" {
  category                   = "Security"
  display_name               = "Computers whose security log was cleared"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_DevicesWithSecurityLogCleared"
  query                      = "search in (SecurityEvent) EventID == 1102 | summarize LogClearedCount = count() by Computer | limit 500000"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-57" {
  category                   = "Security"
  display_name               = "Logon Activity by Computer Where More than 10 logons have happened"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_LogonActivityByDeviceWithMoreThan10Logons"
  query                      = "search in (SecurityEvent) EventID == 4624 | summarize LogonCount = count() by Computer | limit 500000 | where LogonCount > 10"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-58" {
  category                   = "Security"
  display_name               = "Logon Activity by Account"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_LogonActivitybyAccount"
  query                      = "search in (SecurityEvent) EventID == 4624 | summarize LogonCount = count() by Account"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-59" {
  category                   = "Security"
  display_name               = "Logon Activity by Computer"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_LogonActivitybyDevice"
  query                      = "search in (SecurityEvent) EventID == 4624 | summarize LogonCount = count() by Computer | limit 500000"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-60" {
  category                   = "Security"
  display_name               = "Logon Activity by Account for accounts who only logged on less than 5 times"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_LogonActivityforUsersWith5timesActivity"
  query                      = "search in (SecurityEvent) EventID == 4624 | summarize LogonCount = count() by Account | where LogonCount < 5"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-61" {
  category                   = "Security"
  display_name               = "All Process names that were executed"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_ProcessNamesExecuted"
  query                      = "search in (SecurityEvent) EventID == 4688 | summarize ExecutionCount = count() by NewProcessName"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-62" {
  category                   = "Security"
  display_name               = "Accounts who remotely logged on the computer \"Computer01.contoso.com\" (replace with your own computer name)"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_RemotedLoggedAccountsOnDevices"
  query                      = "search in (SecurityEvent) EventID == 4624 and (LogonTypeName == \"3 - Network\" or LogonTypeName == \"10 - RemoteInteractive\") and Computer == \"Computer01.contoso.com\" | summarize RemoteLogonCount = count() by Account"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-63" {
  category                   = "Security"
  display_name               = "Security Activities on the computer \"Computer01.contoso.com\" (replace with your own computer name)"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_SecurityActivitiesonTheDeviceDevice01"
  query                      = "search in (SecurityEvent) Computer == \"COMPUTER01.contoso.com\" | project TimeGenerated, Account, Activity, Computer | sort by TimeGenerated desc"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-64" {
  category                   = "Security"
  display_name               = "Security Activities on the computer \"COMPUTER01.contoso.com\" for account \"Administrator\" (replace with your own computer and account names)"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_SecurityActivitiesonTheDeviceDevice01ForAdmin"
  query                      = "search in (SecurityEvent) Computer == \"COMPUTER01.contoso.com\" and TargetUserName == \"Administrator\" | project TimeGenerated, Account, Activity, Computer | sort by TimeGenerated desc"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-65" {
  category                   = "Security Critical Notable Issues"
  display_name               = "Computers missing security updates"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_SecurityCriticalNotableIssues|ComputersMissingSecurityUpdates"
  query                      = "Update | where UpdateState == 'Needed' and Optional == false and Classification == 'Security Updates' and Approved != false | summarize count() by Computer"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-66" {
  category                   = "Security Critical Notable Issues"
  display_name               = "Computers with detected threats"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_SecurityCriticalNotableIssues|ComputersWithDetectedThreats"
  query                      = "ProtectionStatus | summarize (TimeGenerated, ThreatStatusRank) = argmax(TimeGenerated, ThreatStatusRank) by Computer | where ThreatStatusRank > 199 and ThreatStatusRank != 470"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-67" {
  category                   = "Security Critical Notable Issues"
  display_name               = "Computer with guest account logons"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_SecurityCriticalNotableIssues|ComputersWithGuestAccountLogons"
  query                      = "SecurityEvent | where EventID == 4624 and TargetUserName == 'Guest' and LogonType in (10, 3) | summarize count() by Computer"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-68" {
  category                   = "Security Critical Notable Issues"
  display_name               = "Distinct malicious IP addresses accessed"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_SecurityCriticalNotableIssues|DistinctMaliciousIPAddressesAccessed"
  query                      = "union isfuzzy=true (WireData | where Direction == 'Outbound'), (WindowsFirewall | where CommunicationDirection == 'SEND'), (CommonSecurityLog | where CommunicationDirection == 'Outbound') | where isnotempty(MaliciousIP) | summarize by MaliciousIP"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-69" {
  category                   = "Security Critical Notable Issues"
  display_name               = "High priority Active Directory assessment security recommendations"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_SecurityCriticalNotableIssues|HighPriorityADAssessmentSecurityRecommendations"
  query                      = "let schemaColumns = datatable(TimeGenerated:datetime, RecommendationId:string)[]; union isfuzzy=true schemaColumns, (ADAssessmentRecommendation | where FocusArea == 'Security and Compliance' and RecommendationResult == 'Failed' and RecommendationScore>=35) | summarize arg_max(TimeGenerated, *) by RecommendationId"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-70" {
  category                   = "Security Critical Notable Issues"
  display_name               = "High priority SQL assessment security recommendations"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_SecurityCriticalNotableIssues|HighPrioritySQLAssessmentSecurityRecommendations"
  query                      = "let schemaColumns = datatable(TimeGenerated:datetime, RecommendationId:string)[]; union isfuzzy=true schemaColumns, (SQLAssessmentRecommendation | where FocusArea == 'Security and Compliance' and RecommendationResult == 'Failed' and RecommendationScore>=35) | summarize arg_max(TimeGenerated, *) by RecommendationId"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-71" {
  category                   = "Security Info Notable Issues"
  display_name               = "Accounts failed to log on"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_SecurityInfoNotableIssues|AccountsFailedToLogon"
  query                      = "SecurityEvent | where EventID == 4625 | summarize count() by TargetAccount"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-72" {
  category                   = "Security Info Notable Issues"
  display_name               = "Accounts failed to login (Linux)"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_SecurityInfoNotableIssues|Auditd_AccountsFailedToLogin"
  query                      = "LinuxAuditLog | where RecordType == 'user_login' and res != 'success' | summarize count() by acct"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-73" {
  category                   = "Security Info Notable Issues"
  display_name               = "Executed Commands (Linux)"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_SecurityInfoNotableIssues|Auditd_ExecutedCommands"
  query                      = "LinuxAuditLog | where RecordType == 'syscall' and syscall == 'execve' | summarize count() by cmd"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-74" {
  category                   = "Security Info Notable Issues"
  display_name               = "Loading or Unloading of Kernel modules (Linux)"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_SecurityInfoNotableIssues|Auditd_LoadingOrUnloadingOfKernelModules"
  query                      = "LinuxAuditLog | where key == 'kernelmodules' and RecordType != 'CONFIG_CHANGE'"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-75" {
  category                   = "Security Info Notable Issues"
  display_name               = "Distinct paths of Executed Commands (Linux)"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_SecurityInfoNotableIssues|Auditd_NumberOfDistinctLocationsOfProcessExecuted"
  query                      = "LinuxAuditLog | where RecordType == 'syscall' and syscall == 'execve' | summarize count() by exe"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-76" {
  category                   = "Security Info Notable Issues"
  display_name               = "Change or reset passwords attempts"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_SecurityInfoNotableIssues|ChangeOrResetPasswordsAttempts"
  query                      = "SecurityEvent | where EventID in (4723, 4724) | summarize count() by TargetAccount"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-77" {
  category                   = "Security Info Notable Issues"
  display_name               = "Computers with cleaned event logs"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_SecurityInfoNotableIssues|ComputersWithCleanedEventLogs"
  query                      = "SecurityEvent | where EventID in (1102, 517) and EventSourceName == 'Microsoft-Windows-Eventlog' | summarize count() by Computer"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-78" {
  category                   = "Security Info Notable Issues"
  display_name               = "Computers with failed Linux user password change"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_SecurityInfoNotableIssues|ComputersWithFailedLinuxUserPasswordChange"
  query                      = "Syslog | where Facility == 'authpriv' and ((SyslogMessage has 'passwd:chauthtok' and SyslogMessage has 'authentication failure') or SyslogMessage has 'password change failed') | summarize count() by Computer"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-79" {
  category                   = "Security Info Notable Issues"
  display_name               = "Computers with failed ssh logons"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_SecurityInfoNotableIssues|ComputersWithFailedSshLogons"
  query                      = "Syslog | where (Facility == 'authpriv' and SyslogMessage has 'sshd:auth' and SyslogMessage has 'authentication failure') or (Facility == 'auth' and ((SyslogMessage has 'Failed' and SyslogMessage has 'invalid user' and SyslogMessage has 'ssh2') or SyslogMessage has 'error: PAM: Authentication failure')) | summarize count() by Computer"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-80" {
  category                   = "Security Info Notable Issues"
  display_name               = "Computers with failed su logons"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_SecurityInfoNotableIssues|ComputersWithFailedSuLogons"
  query                      = "Syslog | where (Facility == 'authpriv' and SyslogMessage has 'su:auth' and SyslogMessage has 'authentication failure') or (Facility == 'auth' and SyslogMessage has 'FAILED SU') | summarize count() by Computer"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-81" {
  category                   = "Security Info Notable Issues"
  display_name               = "Computers with failed sudo logons"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_SecurityInfoNotableIssues|ComputersWithFailedSudoLogons"
  query                      = "Syslog | where (Facility == 'authpriv' and SyslogMessage has 'sudo:auth' and (SyslogMessage has 'authentication failure' or SyslogMessage has 'conversation failed')) or ((Facility == 'auth' or Facility == 'authpriv') and SyslogMessage has 'user NOT in sudoers') | summarize count() by Computer"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-82" {
  category                   = "Security Info Notable Issues"
  display_name               = "Computers with new Linux group created"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_SecurityInfoNotableIssues|ComputersWithNewLinuxGroupCreated"
  query                      = "Syslog | where Facility == 'authpriv' and SyslogMessage has 'new group' | summarize count() by Computer"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-83" {
  category                   = "Security Info Notable Issues"
  display_name               = "Computers with users added to a Linux group"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_SecurityInfoNotableIssues|ComputersWithUsersAddedToLinuxGroup"
  query                      = "Syslog | where Facility == 'authpriv' and SyslogMessage has 'to group' and (SyslogMessage has 'add' or SyslogMessage has 'added') | summarize by Computer"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-84" {
  category                   = "Security Info Notable Issues"
  display_name               = "Distinct clients resolving malicious domains"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_SecurityInfoNotableIssues|DistinctClientsResolvingMaliciousDomains"
  query                      = "let schemaColumns = datatable(ClientIP:string)[]; union isfuzzy=true schemaColumns, (DnsEvents | where SubType == 'LookupQuery' and isnotempty(MaliciousIP)) | summarize count() by ClientIP"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-85" {
  category                   = "Security Info Notable Issues"
  display_name               = "Locked accounts"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_SecurityInfoNotableIssues|LockedAccounts"
  query                      = "SecurityEvent | where EventID == 4740 | summarize count() by TargetAccount"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-86" {
  category                   = "Security Info Notable Issues"
  display_name               = "Remote procedure call(RPC) attempts"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_SecurityInfoNotableIssues|RemoteProcedureCallAttempts"
  query                      = "SecurityEvent | where EventID == 5712 | summarize count() by Computer"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-87" {
  category                   = "Security Info Notable Issues"
  display_name               = "Security groups created or modified"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_SecurityInfoNotableIssues|SecurityGroupsCreatedOrModified"
  query                      = "SecurityEvent | where EventID in (4727, 4731, 4735, 4737, 4754, 4755) | summarize count() by TargetAccount"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-88" {
  category                   = "Security Info Notable Issues"
  display_name               = "User accounts created or enabled"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_SecurityInfoNotableIssues|UserAccountsChanged"
  query                      = "SecurityEvent | where EventID in (4720, 4722) | summarize by TargetAccount"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-89" {
  category                   = "Security Warning Notable Issues"
  display_name               = "Computers missing critical updates"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_SecurityWarningNotableIssues|ComputersMissingCriticalUpdates"
  query                      = "Update | where UpdateState == 'Needed' and Optional == false and Classification == 'Critical Updates' and Approved != false | summarize count() by Computer"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-90" {
  category                   = "Security Warning Notable Issues"
  display_name               = "Computers with insufficient  protection"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_SecurityWarningNotableIssues|ComputersWithInsufficientProtection"
  query                      = "ProtectionStatus | summarize (TimeGenerated, ProtectionStatusRank) = argmax(TimeGenerated, ProtectionStatusRank) by Computer | where ProtectionStatusRank > 199 and ProtectionStatusRank != 550"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-91" {
  category                   = "Security Warning Notable Issues"
  display_name               = "Computers with system audit policy changes"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_SecurityWarningNotableIssues|ComputersWithSystemAuditPolicyChanges"
  query                      = "SecurityEvent | where EventID == 4719 | summarize count() by Computer"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-92" {
  category                   = "Security Warning Notable Issues"
  display_name               = "Domain security policy changes"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_SecurityWarningNotableIssues|DomainSecurityPolicyChanges"
  query                      = "SecurityEvent | where EventID == 4739 | summarize count() by DomainPolicyChanged"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-93" {
  category                   = "Security Warning Notable Issues"
  display_name               = "Logons with a clear text password"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_SecurityWarningNotableIssues|LogonsWithClearTextPassword"
  query                      = "SecurityEvent | where EventID == 4624 and LogonType == 8 | summarize count() by TargetAccount"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-94" {
  category                   = "Security Warning Notable Issues"
  display_name               = "Low priority AD assessment security recommendations"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_SecurityWarningNotableIssues|LowPriorityADAssessmentSecurityRecommendations"
  query                      = "let schemaColumns = datatable(TimeGenerated:datetime, RecommendationId:string)[]; union isfuzzy=true schemaColumns, (ADAssessmentRecommendation | where FocusArea == 'Security and Compliance' and RecommendationResult == 'Failed' and RecommendationScore<35) | summarize arg_max(TimeGenerated, *) by RecommendationId"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-95" {
  category                   = "Security Warning Notable Issues"
  display_name               = "Low priority SQL assessment security recommendations"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_SecurityWarningNotableIssues|LowPrioritySQLAssessmentSecurityRecommendations"
  query                      = "let schemaColumns = datatable(TimeGenerated:datetime, RecommendationId:string)[]; union isfuzzy=true schemaColumns, (SQLAssessmentRecommendation | where FocusArea == 'Security and Compliance' and RecommendationResult == 'Failed' and RecommendationScore<35) | summarize arg_max(TimeGenerated, *) by RecommendationId"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-96" {
  category                   = "Security Warning Notable Issues"
  display_name               = "Members added To security-enabled groups"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_SecurityWarningNotableIssues|MembersAddedToSecurityEnabledGroups"
  query                      = "SecurityEvent | where EventID in (4728, 4732, 4756) | summarize count() by SubjectAccount"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-97" {
  category                   = "Security Warning Notable Issues"
  display_name               = "Suspicious executables"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-001)_SecurityWarningNotableIssues|SuspiciousExecutables"
  query                      = "SecurityEvent | where EventID == 8002 and Fqbn == '-' | summarize ExecutionCountHash=count() by FileHash | where ExecutionCountHash <= 5"
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-98" {
  category                   = "ChangeTracking"
  display_name               = "MicrosoftDefaultComputerGroup"
  function_alias             = "ChangeTracking__MicrosoftDefaultComputerGroup"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  name                       = "changetracking|microsoftdefaultcomputergroup"
  query                      = "Heartbeat | where Computer in~ (\"\") or VMUUID in~ (\"13bf2a5c-afbe-4d78-91ce-3a808d1ad04f\", \"5c2abf13-beaf-784d-91ce-3a808d1ad04f\", \"d6187ded-dd60-4b88-92a0-ebc2e0b51ed6\", \"ed7d18d6-60dd-884b-92a0-ebc2e0b51ed6\", \"6342d494-96b0-4c4b-8bee-425bb33329ba\", \"94d44263-b096-4b4c-8bee-425bb33329ba\", \"18b5bfb1-008f-4de8-8f81-6141de5c0cd2\", \"b1bfb518-8f00-e84d-8f81-6141de5c0cd2\", \"93bd1cf0-2567-4858-a691-74e5013bc68d\", \"f01cbd93-6725-5848-a691-74e5013bc68d\", \"b9ff7a98-2fa4-4065-b5eb-ddddba42962f\", \"987affb9-a42f-6540-b5eb-ddddba42962f\", \"56bf40a9-48b8-40f6-abf0-426cd94cd5ea\", \"a940bf56-b848-f640-abf0-426cd94cd5ea\", \"71b40635-72fc-4123-a3e4-90097822b7d2\", \"3506b471-fc72-2341-a3e4-90097822b7d2\", \"74b717f3-032d-42b5-8e0c-0300b160187e\", \"f317b774-2d03-b542-8e0c-0300b160187e\", \"93e8b191-65ec-44bb-8999-580acb07a0a2\", \"91b1e893-ec65-bb44-8999-580acb07a0a2\", \"df62a4b1-e51d-496b-8961-340eb3503529\", \"b1a462df-1de5-6b49-8961-340eb3503529\", \"adca1e92-52f2-4802-b6e1-757564b113f1\", \"921ecaad-f252-0248-b6e1-757564b113f1\", \"b0799d89-607c-4c69-92d2-8ced87e01d82\") | distinct Computer"
  tags = {
    Group = "Computer"
  }
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_solution" "res-764" {
  location            = "northeurope"
  resource_group_name = "M-CSSPZ-RG-MAN-PRD-002"
  solution_name       = "ChangeTracking"
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
  workspace_name        = "R-CSSPZ-LOGS-MAN-PRD-001"
  workspace_resource_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  plan {
    product   = "OMSGallery/ChangeTracking"
    publisher = "Microsoft"
  }
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_log_analytics_solution" "res-765" {
  location            = "northeurope"
  resource_group_name = "M-CSSPZ-RG-MAN-PRD-002"
  solution_name       = "SecurityCenterFree"
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
  workspace_name        = "R-CSSPZ-LOGS-MAN-PRD-001"
  workspace_resource_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  plan {
    product   = "OMSGallery/SecurityCenterFree"
    publisher = "Microsoft"
  }
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
resource "azurerm_monitor_activity_log_alert" "res-766" {
  description         = "Azure Prod VM Health Status Degraded"
  name                = "Azure Prod VM Health Status Degraded"
  resource_group_name = "M-CSSPZ-RG-MAN-PRD-002"
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
    action_group_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourcegroups/r-csspz-rg-man-prd-009/providers/microsoft.insights/actiongroups/vipsupport"
    webhook_properties = {
      AssignmentGroup = "HCL-VIP-Support"
      Service         = "Azure Cloud Platform Application Service"
      SubType         = "TestExampleAvailableDiskSpaceAlert"
      Type            = "Capacity"
    }
  }
  action {
    action_group_id = "/subscriptions/b97da650-b444-4530-9f4b-968706a96e1b/resourcegroups/m-csspz-rg-soc-prd-001/providers/microsoft.insights/actiongroups/servicenow azure monitor sync"
    webhook_properties = {
      AssignmentGroup = "HCL-VIP-Support"
      Service         = "Azure Cloud Platform Application Service"
      SubType         = "TestExampleAvailableDiskSpaceAlert"
      Type            = "Capacity"
    }
  }
  criteria {
    category       = "ResourceHealth"
    resource_types = ["microsoft.compute/virtualmachines"]
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_monitor_activity_log_alert" "res-767" {
  name                = "Service Health Alert"
  resource_group_name = "M-CSSPZ-RG-MAN-PRD-002"
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
    action_group_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourcegroups/r-csspz-rg-man-prd-009/providers/microsoft.insights/actiongroups/vipsupport"
  }
  criteria {
    category = "ResourceHealth"
    statuses = ["In Progress", "Active"]
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_monitor_activity_log_alert" "res-768" {
  name                = "Service Health Alerts"
  resource_group_name = "M-CSSPZ-RG-MAN-PRD-002"
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
    action_group_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/microsoft.insights/actiongroups/VIPSupport"
  }
  criteria {
    category = "ServiceHealth"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_monitor_data_collection_endpoint" "res-769" {
  location            = "northeurope"
  name                = "NWTA-cca82599-4280-4ce1-8db8-0dc465K83EQK"
  resource_group_name = "m-csspz-rg-man-prd-002"
  tags = {
    "Account Type"            = "PLACEHOLDER"
    "App Support"             = "PLACEHOLDER"
    "BOI Application"         = "PLACEHOLDER"
    "BOI Application Service" = "PLACEHOLDER"
    Backup                    = "PLACEHOLDER"
    "Business Function"       = "PLACEHOLDER"
    "Business Unit"           = "PLACEHOLDER"
    Compliance                = "PLACEHOLDER"
    Confidentiality           = "PLACEHOLDER"
    "Cost Centre"             = "PLACEHOLDER"
    "Data Sensitivity"        = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
    "Infra Support"           = "PLACEHOLDER"
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
    "Support Groups"          = "PLACEHOLDER"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_monitor_data_collection_rule" "res-770" {
  data_collection_endpoint_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/m-csspz-rg-man-prd-002/providers/Microsoft.Insights/dataCollectionEndpoints/NWTA-cca82599-4280-4ce1-8db8-0dc465K83EQK"
  location                    = "northeurope"
  name                        = "NWTA-cca82599-4280-4ce1-8db8-0dc465ff83be8UQIXD"
  resource_group_name         = "m-csspz-rg-man-prd-002"
  tags = {
    "Account Type"            = "PLACEHOLDER"
    "App Support"             = "PLACEHOLDER"
    "BOI Application"         = "PLACEHOLDER"
    "BOI Application Service" = "PLACEHOLDER"
    Backup                    = "PLACEHOLDER"
    "Business Function"       = "PLACEHOLDER"
    "Business Unit"           = "PLACEHOLDER"
    Compliance                = "PLACEHOLDER"
    Confidentiality           = "PLACEHOLDER"
    "Cost Centre"             = "PLACEHOLDER"
    "Data Sensitivity"        = "PLACEHOLDER"
    Description               = "PLACEHOLDER"
    Environment               = "PLACEHOLDER"
    "Infra Support"           = "PLACEHOLDER"
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
    "Support Groups"          = "PLACEHOLDER"
  }
  data_flow {
    destinations = ["r-csspz-logs-man-prd-001"]
    streams      = ["Microsoft-NTANetAnalytics", "Microsoft-NTATopologyDetails", "Microsoft-NTAIpDetails", "Microsoft-NTAInsights"]
  }
  destinations {
    log_analytics {
      name                  = "r-csspz-logs-man-prd-001"
      workspace_resource_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
    }
  }
  depends_on = [
    azurerm_monitor_data_collection_endpoint.res-769,
  ]
}
resource "azurerm_log_analytics_solution" "res-771" {
  location            = "northeurope"
  resource_group_name = "m-csspz-rg-man-prd-002"
  solution_name       = "SQLAdvancedThreatProtection"
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
  workspace_name        = "r-csspz-logs-man-prd-001"
  workspace_resource_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
  plan {
    product   = "OMSGallery/SQLAdvancedThreatProtection"
    publisher = "Microsoft"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_log_analytics_solution" "res-772" {
  location            = "northeurope"
  resource_group_name = "m-csspz-rg-man-prd-002"
  solution_name       = "SQLVulnerabilityAssessment"
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
  workspace_name        = "r-csspz-logs-man-prd-001"
  workspace_resource_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/m-csspz-rg-man-prd-002/providers/Microsoft.OperationalInsights/workspaces/r-csspz-logs-man-prd-001"
  plan {
    product   = "OMSGallery/SQLVulnerabilityAssessment"
    publisher = "Microsoft"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_log_analytics_solution" "res-773" {
  location            = "northeurope"
  resource_group_name = "m-csspz-rg-man-prd-002"
  solution_name       = "Security"
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
  workspace_name        = "r-csspz-logs-man-prd-001"
  workspace_resource_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/m-csspz-rg-man-prd-002/providers/Microsoft.OperationalInsights/workspaces/r-csspz-logs-man-prd-001"
  plan {
    product   = "OMSGallery/Security"
    publisher = "Microsoft"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_security_center_automation" "res-774" {
  description         = "Export Microsoft Defender for Cloud data to Log Analytics workspace via policy"
  location            = "northeurope"
  name                = "ExportToWorkspace"
  resource_group_name = "m-csspz-rg-man-prd-002"
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
    resource_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-002/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-001"
    type        = "loganalytics"
  }
  source {
    event_source = "SubAssessments"
  }
  source {
    event_source = "Assessments"
    rule_set {
      rule {
        expected_value = "Microsoft.Security/assessments"
        operator       = "Contains"
        property_path  = "type"
        property_type  = "String"
      }
      rule {
        expected_value = "High"
        operator       = "Equals"
        property_path  = "properties.metadata.severity"
        property_type  = "String"
      }
    }
    rule_set {
      rule {
        expected_value = "Microsoft.Security/assessments"
        operator       = "Contains"
        property_path  = "type"
        property_type  = "String"
      }
      rule {
        expected_value = "Medium"
        operator       = "Equals"
        property_path  = "properties.metadata.severity"
        property_type  = "String"
      }
    }
    rule_set {
      rule {
        expected_value = "Microsoft.Security/assessments"
        operator       = "Contains"
        property_path  = "type"
        property_type  = "String"
      }
      rule {
        expected_value = "Low"
        operator       = "Equals"
        property_path  = "properties.metadata.severity"
        property_type  = "String"
      }
    }
  }
  source {
    event_source = "Alerts"
    rule_set {
      rule {
        expected_value = "high"
        operator       = "Equals"
        property_path  = "Severity"
        property_type  = "String"
      }
    }
    rule_set {
      rule {
        expected_value = "medium"
        operator       = "Equals"
        property_path  = "Severity"
        property_type  = "String"
      }
    }
    rule_set {
      rule {
        expected_value = "low"
        operator       = "Equals"
        property_path  = "Severity"
        property_type  = "String"
      }
    }
  }
  source {
    event_source = "SecureScores"
  }
  source {
    event_source = "SecureScoreControls"
  }
  source {
    event_source = "RegulatoryComplianceAssessment"
  }
  source {
    event_source = "SecureScoresSnapshot"
  }
  source {
    event_source = "SecureScoreControlsSnapshot"
  }
  source {
    event_source = "RegulatoryComplianceAssessmentSnapshot"
  }
  source {
    event_source = "AssessmentsSnapshot"
    rule_set {
      rule {
        expected_value = "Microsoft.Security/assessments"
        operator       = "Contains"
        property_path  = "type"
        property_type  = "String"
      }
      rule {
        expected_value = "High"
        operator       = "Equals"
        property_path  = "properties.metadata.severity"
        property_type  = "String"
      }
    }
    rule_set {
      rule {
        expected_value = "Microsoft.Security/assessments"
        operator       = "Contains"
        property_path  = "type"
        property_type  = "String"
      }
      rule {
        expected_value = "Medium"
        operator       = "Equals"
        property_path  = "properties.metadata.severity"
        property_type  = "String"
      }
    }
    rule_set {
      rule {
        expected_value = "Microsoft.Security/assessments"
        operator       = "Contains"
        property_path  = "type"
        property_type  = "String"
      }
      rule {
        expected_value = "Low"
        operator       = "Equals"
        property_path  = "properties.metadata.severity"
        property_type  = "String"
      }
    }
  }
  source {
    event_source = "SubAssessmentsSnapshot"
  }
  depends_on = [
    azurerm_log_analytics_workspace.res-5,
  ]
}
