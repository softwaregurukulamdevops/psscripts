resource "azurerm_monitor_action_group" "res-0" {
  name                = "Application Insights Smart Detection"
  resource_group_name = "R-CSSPZ-RG-MAN-PRD-009"
  short_name          = "SmartDetect"
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
  arm_role_receiver {
    name                    = "Monitoring Contributor"
    role_id                 = "749f88d5-cbae-40b8-bcfc-e573ddc772fa"
    use_common_alert_schema = true
  }
  arm_role_receiver {
    name                    = "Monitoring Reader"
    role_id                 = "43d0d8ad-25c7-4714-9337-8ba259a9fe05"
    use_common_alert_schema = true
  }
  depends_on = [
    azurerm_resource_group.res-2,
  ]
}
resource "azurerm_monitor_action_group" "res-1" {
  name                = "VIPSupport"
  resource_group_name = "R-CSSPZ-RG-MAN-PRD-009"
  short_name          = "VIPSupport"
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
    email_address = "AWSVIPTeam@boi.com"
    name          = "LogCollector Servers CPU Alert_-EmailAction-"
  }
  depends_on = [
    azurerm_resource_group.res-2,
  ]
}
resource "azurerm_resource_group" "res-2" {
  location = "northeurope"
  name     = "R-CSSPZ-RG-MAN-PRD-009"
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
resource "azurerm_monitor_data_collection_rule" "res-3" {
  kind                = "Linux"
  location            = "northeurope"
  name                = "R-CSSPZ-DCR-MAN-PRD-003"
  resource_group_name = "R-CSSPZ-RG-MAN-PRD-009"
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
    destinations = ["azureMonitorMetrics-default"]
    streams      = ["Microsoft-InsightsMetrics"]
  }
  data_sources {
    performance_counter {
      counter_specifiers            = ["Processor(*)\\% Processor Time", "Processor(*)\\% Idle Time", "Processor(*)\\% User Time", "Processor(*)\\% Nice Time", "Processor(*)\\% Privileged Time", "Processor(*)\\% IO Wait Time", "Processor(*)\\% Interrupt Time", "Processor(*)\\% DPC Time", "Memory(*)\\Available MBytes Memory", "Memory(*)\\% Available Memory", "Memory(*)\\Used Memory MBytes", "Memory(*)\\% Used Memory", "Memory(*)\\Pages/sec", "Memory(*)\\Page Reads/sec", "Memory(*)\\Page Writes/sec", "Memory(*)\\Available MBytes Swap", "Memory(*)\\% Available Swap Space", "Memory(*)\\Used MBytes Swap Space", "Memory(*)\\% Used Swap Space", "Process(*)\\Pct User Time", "Process(*)\\Pct Privileged Time", "Process(*)\\Used Memory", "Process(*)\\Virtual Shared Memory", "Logical Disk(*)\\% Free Inodes", "Logical Disk(*)\\% Used Inodes", "Logical Disk(*)\\Free Megabytes", "Logical Disk(*)\\% Free Space", "Logical Disk(*)\\% Used Space", "Logical Disk(*)\\Logical Disk Bytes/sec", "Logical Disk(*)\\Disk Read Bytes/sec", "Logical Disk(*)\\Disk Write Bytes/sec", "Logical Disk(*)\\Disk Transfers/sec", "Logical Disk(*)\\Disk Reads/sec", "Logical Disk(*)\\Disk Writes/sec", "Network(*)\\Total Bytes Transmitted", "Network(*)\\Total Bytes Received", "Network(*)\\Total Bytes", "Network(*)\\Total Packets Transmitted", "Network(*)\\Total Packets Received", "Network(*)\\Total Rx Errors", "Network(*)\\Total Tx Errors", "Network(*)\\Total Collisions", "System(*)\\Uptime", "System(*)\\Load1", "System(*)\\Load5", "System(*)\\Load15", "System(*)\\Users", "System(*)\\Unique Users", "System(*)\\CPUs"]
      name                          = "perfCounterDataSource60"
      sampling_frequency_in_seconds = 60
      streams                       = ["Microsoft-InsightsMetrics"]
    }
  }
  destinations {
    azure_monitor_metrics {
      name = "azureMonitorMetrics-default"
    }
  }
  depends_on = [
    azurerm_resource_group.res-2,
  ]
}
resource "azurerm_log_analytics_workspace" "res-4" {
  location            = "northeurope"
  name                = "R-CSSPZ-LOGS-MAN-PRD-002"
  resource_group_name = "R-CSSPZ-RG-MAN-PRD-009"
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
    azurerm_resource_group.res-2,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-5" {
  category                   = "General Exploration"
  display_name               = "All Computers with their most recent data"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-002)_General|AlphabeticallySortedComputers"
  query                      = "search not(ObjectName == \"Advisor Metrics\" or ObjectName == \"ManagedSpace\") | summarize AggregatedValue = max(TimeGenerated) by Computer | limit 500000 | sort by Computer asc\r\n// Oql: NOT(ObjectName=\"Advisor Metrics\" OR ObjectName=ManagedSpace) | measure max(TimeGenerated) by Computer | top 500000 | Sort Computer // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-6" {
  category                   = "General Exploration"
  display_name               = "Stale Computers (data older than 24 hours)"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-002)_General|StaleComputers"
  query                      = "search not(ObjectName == \"Advisor Metrics\" or ObjectName == \"ManagedSpace\") | summarize lastdata = max(TimeGenerated) by Computer | limit 500000 | where lastdata < ago(24h)\r\n// Oql: NOT(ObjectName=\"Advisor Metrics\" OR ObjectName=ManagedSpace) | measure max(TimeGenerated) as lastdata by Computer | top 500000 | where lastdata < NOW-24HOURS // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-7" {
  category                   = "General Exploration"
  display_name               = "Which Management Group is generating the most data points?"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-002)_General|dataPointsPerManagementGroup"
  query                      = "search * | summarize AggregatedValue = count() by ManagementGroupName\r\n// Oql: * | Measure count() by ManagementGroupName // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-8" {
  category                   = "General Exploration"
  display_name               = "Distribution of data Types"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-002)_General|dataTypeDistribution"
  query                      = "search * | extend Type = $table | summarize AggregatedValue = count() by Type\r\n// Oql: * | Measure count() by Type // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-9" {
  category                   = "Log Management"
  display_name               = "All Events"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-002)_LogManagement|AllEvents"
  query                      = "Event | sort by TimeGenerated desc\r\n// Oql: Type=Event // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-10" {
  category                   = "Log Management"
  display_name               = "All Syslogs"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-002)_LogManagement|AllSyslog"
  query                      = "Syslog | sort by TimeGenerated desc\r\n// Oql: Type=Syslog // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-11" {
  category                   = "Log Management"
  display_name               = "All Syslog Records grouped by Facility"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-002)_LogManagement|AllSyslogByFacility"
  query                      = "Syslog | summarize AggregatedValue = count() by Facility\r\n// Oql: Type=Syslog | Measure count() by Facility // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-12" {
  category                   = "Log Management"
  display_name               = "All Syslog Records grouped by ProcessName"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-002)_LogManagement|AllSyslogByProcessName"
  query                      = "Syslog | summarize AggregatedValue = count() by ProcessName\r\n// Oql: Type=Syslog | Measure count() by ProcessName // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-13" {
  category                   = "Log Management"
  display_name               = "All Syslog Records with Errors"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-002)_LogManagement|AllSyslogsWithErrors"
  query                      = "Syslog | where SeverityLevel == \"error\" | sort by TimeGenerated desc\r\n// Oql: Type=Syslog SeverityLevel=error // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-14" {
  category                   = "Log Management"
  display_name               = "Average HTTP Request time by Client IP Address"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-002)_LogManagement|AverageHTTPRequestTimeByClientIPAddress"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = avg(TimeTaken) by cIP\r\n// Oql: Type=W3CIISLog | Measure Avg(TimeTaken) by cIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-15" {
  category                   = "Log Management"
  display_name               = "Average HTTP Request time by HTTP Method"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-002)_LogManagement|AverageHTTPRequestTimeHTTPMethod"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = avg(TimeTaken) by csMethod\r\n// Oql: Type=W3CIISLog | Measure Avg(TimeTaken) by csMethod // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-16" {
  category                   = "Log Management"
  display_name               = "Count of IIS Log Entries by Client IP Address"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-002)_LogManagement|CountIISLogEntriesClientIPAddress"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by cIP\r\n// Oql: Type=W3CIISLog | Measure count() by cIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-17" {
  category                   = "Log Management"
  display_name               = "Count of IIS Log Entries by HTTP Request Method"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-002)_LogManagement|CountIISLogEntriesHTTPRequestMethod"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csMethod\r\n// Oql: Type=W3CIISLog | Measure count() by csMethod // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-18" {
  category                   = "Log Management"
  display_name               = "Count of IIS Log Entries by HTTP User Agent"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-002)_LogManagement|CountIISLogEntriesHTTPUserAgent"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csUserAgent\r\n// Oql: Type=W3CIISLog | Measure count() by csUserAgent // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-19" {
  category                   = "Log Management"
  display_name               = "Count of IIS Log Entries by Host requested by client"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-002)_LogManagement|CountOfIISLogEntriesByHostRequestedByClient"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csHost\r\n// Oql: Type=W3CIISLog | Measure count() by csHost // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-20" {
  category                   = "Log Management"
  display_name               = "Count of IIS Log Entries by URL for the host \"www.contoso.com\" (replace with your own)"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-002)_LogManagement|CountOfIISLogEntriesByURLForHost"
  query                      = "search csHost == \"www.contoso.com\" | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csUriStem\r\n// Oql: Type=W3CIISLog csHost=\"www.contoso.com\" | Measure count() by csUriStem // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-21" {
  category                   = "Log Management"
  display_name               = "Count of IIS Log Entries by URL requested by client (without query strings)"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-002)_LogManagement|CountOfIISLogEntriesByURLRequestedByClient"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csUriStem\r\n// Oql: Type=W3CIISLog | Measure count() by csUriStem // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-22" {
  category                   = "Log Management"
  display_name               = "Count of Events with level \"Warning\" grouped by Event ID"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-002)_LogManagement|CountOfWarningEvents"
  query                      = "Event | where EventLevelName == \"warning\" | summarize AggregatedValue = count() by EventID\r\n// Oql: Type=Event EventLevelName=warning | Measure count() by EventID // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-23" {
  category                   = "Log Management"
  display_name               = "Shows breakdown of response codes"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-002)_LogManagement|DisplayBreakdownRespondCodes"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by scStatus\r\n// Oql: Type=W3CIISLog | Measure count() by scStatus // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-24" {
  category                   = "Log Management"
  display_name               = "Count of Events grouped by Event Log"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-002)_LogManagement|EventsByEventLog"
  query                      = "Event | summarize AggregatedValue = count() by EventLog\r\n// Oql: Type=Event | Measure count() by EventLog // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-25" {
  category                   = "Log Management"
  display_name               = "Count of Events grouped by Event Source"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-002)_LogManagement|EventsByEventSource"
  query                      = "Event | summarize AggregatedValue = count() by Source\r\n// Oql: Type=Event | Measure count() by Source // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-26" {
  category                   = "Log Management"
  display_name               = "Count of Events grouped by Event ID"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-002)_LogManagement|EventsByEventsID"
  query                      = "Event | summarize AggregatedValue = count() by EventID\r\n// Oql: Type=Event | Measure count() by EventID // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-27" {
  category                   = "Log Management"
  display_name               = "Events in the Operations Manager Event Log whose Event ID is in the range between 2000 and 3000"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-002)_LogManagement|EventsInOMBetween2000to3000"
  query                      = "Event | where EventLog == \"Operations Manager\" and EventID >= 2000 and EventID <= 3000 | sort by TimeGenerated desc\r\n// Oql: Type=Event EventLog=\"Operations Manager\" EventID:[2000..3000] // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-28" {
  category                   = "Log Management"
  display_name               = "Count of Events containing the word \"started\" grouped by EventID"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-002)_LogManagement|EventsWithStartedinEventID"
  query                      = "search in (Event) \"started\" | summarize AggregatedValue = count() by EventID\r\n// Oql: Type=Event \"started\" | Measure count() by EventID // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-29" {
  category                   = "Log Management"
  display_name               = "Find the maximum time taken for each page"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-002)_LogManagement|FindMaximumTimeTakenForEachPage"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = max(TimeTaken) by csUriStem\r\n// Oql: Type=W3CIISLog | Measure Max(TimeTaken) by csUriStem // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-30" {
  category                   = "Log Management"
  display_name               = "IIS Log Entries for a specific client IP Address (replace with your own)"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-002)_LogManagement|IISLogEntriesForClientIP"
  query                      = "search cIP == \"192.168.0.1\" | extend Type = $table | where Type == W3CIISLog | sort by TimeGenerated desc | project csUriStem, scBytes, csBytes, TimeTaken, scStatus\r\n// Oql: Type=W3CIISLog cIP=\"192.168.0.1\" | Select csUriStem,scBytes,csBytes,TimeTaken,scStatus // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-31" {
  category                   = "Log Management"
  display_name               = "All IIS Log Entries"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-002)_LogManagement|ListAllIISLogEntries"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | sort by TimeGenerated desc\r\n// Oql: Type=W3CIISLog // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-32" {
  category                   = "Log Management"
  display_name               = "How many connections to Operations Manager's SDK service by day"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-002)_LogManagement|NoOfConnectionsToOMSDKService"
  query                      = "Event | where EventID == 26328 and EventLog == \"Operations Manager\" | summarize AggregatedValue = count() by bin(TimeGenerated, 1d) | sort by TimeGenerated desc\r\n// Oql: Type=Event EventID=26328 EventLog=\"Operations Manager\" | Measure count() interval 1DAY // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-33" {
  category                   = "Log Management"
  display_name               = "When did my servers initiate restart?"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-002)_LogManagement|ServerRestartTime"
  query                      = "search in (Event) \"shutdown\" and EventLog == \"System\" and Source == \"User32\" and EventID == 1074 | sort by TimeGenerated desc | project TimeGenerated, Computer\r\n// Oql: shutdown Type=Event EventLog=System Source=User32 EventID=1074 | Select TimeGenerated,Computer // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-34" {
  category                   = "Log Management"
  display_name               = "Shows which pages people are getting a 404 for"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-002)_LogManagement|Show404PagesList"
  query                      = "search scStatus == 404 | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csUriStem\r\n// Oql: Type=W3CIISLog scStatus=404 | Measure count() by csUriStem // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-35" {
  category                   = "Log Management"
  display_name               = "Shows servers that are throwing internal server error"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-002)_LogManagement|ShowServersThrowingInternalServerError"
  query                      = "search scStatus == 500 | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by sComputerName\r\n// Oql: Type=W3CIISLog scStatus=500 | Measure count() by sComputerName // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-36" {
  category                   = "Log Management"
  display_name               = "Total Bytes received by each Azure Role Instance"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-002)_LogManagement|TotalBytesReceivedByEachAzureRoleInstance"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(csBytes) by RoleInstance\r\n// Oql: Type=W3CIISLog | Measure Sum(csBytes) by RoleInstance // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-37" {
  category                   = "Log Management"
  display_name               = "Total Bytes received by each IIS Computer"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-002)_LogManagement|TotalBytesReceivedByEachIISComputer"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(csBytes) by Computer | limit 500000\r\n// Oql: Type=W3CIISLog | Measure Sum(csBytes) by Computer | top 500000 // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-38" {
  category                   = "Log Management"
  display_name               = "Total Bytes responded back to clients by Client IP Address"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-002)_LogManagement|TotalBytesRespondedToClientsByClientIPAddress"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(scBytes) by cIP\r\n// Oql: Type=W3CIISLog | Measure Sum(scBytes) by cIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-39" {
  category                   = "Log Management"
  display_name               = "Total Bytes responded back to clients by each IIS ServerIP Address"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-002)_LogManagement|TotalBytesRespondedToClientsByEachIISServerIPAddress"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(scBytes) by sIP\r\n// Oql: Type=W3CIISLog | Measure Sum(scBytes) by sIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-40" {
  category                   = "Log Management"
  display_name               = "Total Bytes sent by Client IP Address"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-002)_LogManagement|TotalBytesSentByClientIPAddress"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(csBytes) by cIP\r\n// Oql: Type=W3CIISLog | Measure Sum(csBytes) by cIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-41" {
  category                   = "Log Management"
  display_name               = "All Events with level \"Warning\""
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-002)_LogManagement|WarningEvents"
  query                      = "Event | where EventLevelName == \"warning\" | sort by TimeGenerated desc\r\n// Oql: Type=Event EventLevelName=warning // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-42" {
  category                   = "Log Management"
  display_name               = "Windows Firewall Policy settings have changed"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-002)_LogManagement|WindowsFireawallPolicySettingsChanged"
  query                      = "Event | where EventLog == \"Microsoft-Windows-Windows Firewall With Advanced Security/Firewall\" and EventID == 2008 | sort by TimeGenerated desc\r\n// Oql: Type=Event EventLog=\"Microsoft-Windows-Windows Firewall With Advanced Security/Firewall\" EventID=2008 // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-43" {
  category                   = "Log Management"
  display_name               = "On which machines and how many times have Windows Firewall Policy settings changed"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "LogManagement(R-CSSPZ-LOGS-MAN-PRD-002)_LogManagement|WindowsFireawallPolicySettingsChangedByMachines"
  query                      = "Event | where EventLog == \"Microsoft-Windows-Windows Firewall With Advanced Security/Firewall\" and EventID == 2008 | summarize AggregatedValue = count() by Computer | limit 500000\r\n// Oql: Type=Event EventLog=\"Microsoft-Windows-Windows Firewall With Advanced Security/Firewall\" EventID=2008 | measure count() by Computer | top 500000 // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-44" {
  category                   = "Security"
  display_name               = "Accounts who terminated Microsoft antimalware (\"MsMpEng.exe\") on any computer"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_AccountsWhoTerminatedMicrosoftAntimalware"
  query                      = "search in (SecurityEvent) EventID == 4689 and \"MsMpEng.exe\" | summarize TerminationCount = count() by Account"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-45" {
  category                   = "Security"
  display_name               = "All Security Activities"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_AllSecurityActivities"
  query                      = "search in (SecurityEvent) * | project TimeGenerated, Account, Activity, Computer | sort by TimeGenerated desc"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-46" {
  category                   = "Security"
  display_name               = "Computers where \"hash.exe\" was executed (replace with different process name) more than 5 times"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_DevicesWhereHashWasExecuted"
  query                      = "search in (SecurityEvent) EventID == 4688 and \"hash.exe\" | summarize ExecutionCount = count() by Computer | limit 500000 | where ExecutionCount > 5"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-47" {
  category                   = "Security"
  display_name               = "Computers where the Microsoft antimalware process (\"MsMpEng.exe\") was terminated"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_DevicesWhereTheMicrosoftAntimalwareProcessTerminated"
  query                      = "search in (SecurityEvent) EventID == 4689 and \"MsMpEng.exe\" | summarize TerminationCount = count() by Computer | limit 500000"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-48" {
  category                   = "Security"
  display_name               = "Computers whose security log was cleared"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_DevicesWithSecurityLogCleared"
  query                      = "search in (SecurityEvent) EventID == 1102 | summarize LogClearedCount = count() by Computer | limit 500000"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-49" {
  category                   = "Security"
  display_name               = "Logon Activity by Computer Where More than 10 logons have happened"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_LogonActivityByDeviceWithMoreThan10Logons"
  query                      = "search in (SecurityEvent) EventID == 4624 | summarize LogonCount = count() by Computer | limit 500000 | where LogonCount > 10"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-50" {
  category                   = "Security"
  display_name               = "Logon Activity by Account"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_LogonActivitybyAccount"
  query                      = "search in (SecurityEvent) EventID == 4624 | summarize LogonCount = count() by Account"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-51" {
  category                   = "Security"
  display_name               = "Logon Activity by Computer"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_LogonActivitybyDevice"
  query                      = "search in (SecurityEvent) EventID == 4624 | summarize LogonCount = count() by Computer | limit 500000"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-52" {
  category                   = "Security"
  display_name               = "Logon Activity by Account for accounts who only logged on less than 5 times"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_LogonActivityforUsersWith5timesActivity"
  query                      = "search in (SecurityEvent) EventID == 4624 | summarize LogonCount = count() by Account | where LogonCount < 5"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-53" {
  category                   = "Security"
  display_name               = "All Process names that were executed"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_ProcessNamesExecuted"
  query                      = "search in (SecurityEvent) EventID == 4688 | summarize ExecutionCount = count() by NewProcessName"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-54" {
  category                   = "Security"
  display_name               = "Accounts who remotely logged on the computer \"Computer01.contoso.com\" (replace with your own computer name)"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_RemotedLoggedAccountsOnDevices"
  query                      = "search in (SecurityEvent) EventID == 4624 and (LogonTypeName == \"3 - Network\" or LogonTypeName == \"10 - RemoteInteractive\") and Computer == \"Computer01.contoso.com\" | summarize RemoteLogonCount = count() by Account"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-55" {
  category                   = "Security"
  display_name               = "Security Activities on the computer \"Computer01.contoso.com\" (replace with your own computer name)"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_SecurityActivitiesonTheDeviceDevice01"
  query                      = "search in (SecurityEvent) Computer == \"COMPUTER01.contoso.com\" | project TimeGenerated, Account, Activity, Computer | sort by TimeGenerated desc"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-56" {
  category                   = "Security"
  display_name               = "Security Activities on the computer \"COMPUTER01.contoso.com\" for account \"Administrator\" (replace with your own computer and account names)"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_SecurityActivitiesonTheDeviceDevice01ForAdmin"
  query                      = "search in (SecurityEvent) Computer == \"COMPUTER01.contoso.com\" and TargetUserName == \"Administrator\" | project TimeGenerated, Account, Activity, Computer | sort by TimeGenerated desc"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-57" {
  category                   = "Security Critical Notable Issues"
  display_name               = "Computers missing security updates"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_SecurityCriticalNotableIssues|ComputersMissingSecurityUpdates"
  query                      = "Update | where UpdateState == 'Needed' and Optional == false and Classification == 'Security Updates' and Approved != false | summarize count() by Computer"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-58" {
  category                   = "Security Critical Notable Issues"
  display_name               = "Computers with detected threats"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_SecurityCriticalNotableIssues|ComputersWithDetectedThreats"
  query                      = "ProtectionStatus | summarize (TimeGenerated, ThreatStatusRank) = argmax(TimeGenerated, ThreatStatusRank) by Computer | where ThreatStatusRank > 199 and ThreatStatusRank != 470"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-59" {
  category                   = "Security Critical Notable Issues"
  display_name               = "Computer with guest account logons"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_SecurityCriticalNotableIssues|ComputersWithGuestAccountLogons"
  query                      = "SecurityEvent | where EventID == 4624 and TargetUserName == 'Guest' and LogonType in (10, 3) | summarize count() by Computer"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-60" {
  category                   = "Security Critical Notable Issues"
  display_name               = "Distinct malicious IP addresses accessed"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_SecurityCriticalNotableIssues|DistinctMaliciousIPAddressesAccessed"
  query                      = "union isfuzzy=true (WireData | where Direction == 'Outbound'), (WindowsFirewall | where CommunicationDirection == 'SEND'), (CommonSecurityLog | where CommunicationDirection == 'Outbound') | where isnotempty(MaliciousIP) | summarize by MaliciousIP"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-61" {
  category                   = "Security Critical Notable Issues"
  display_name               = "High priority Active Directory assessment security recommendations"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_SecurityCriticalNotableIssues|HighPriorityADAssessmentSecurityRecommendations"
  query                      = "let schemaColumns = datatable(TimeGenerated:datetime, RecommendationId:string)[]; union isfuzzy=true schemaColumns, (ADAssessmentRecommendation | where FocusArea == 'Security and Compliance' and RecommendationResult == 'Failed' and RecommendationScore>=35) | summarize arg_max(TimeGenerated, *) by RecommendationId"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-62" {
  category                   = "Security Critical Notable Issues"
  display_name               = "High priority SQL assessment security recommendations"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_SecurityCriticalNotableIssues|HighPrioritySQLAssessmentSecurityRecommendations"
  query                      = "let schemaColumns = datatable(TimeGenerated:datetime, RecommendationId:string)[]; union isfuzzy=true schemaColumns, (SQLAssessmentRecommendation | where FocusArea == 'Security and Compliance' and RecommendationResult == 'Failed' and RecommendationScore>=35) | summarize arg_max(TimeGenerated, *) by RecommendationId"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-63" {
  category                   = "Security Info Notable Issues"
  display_name               = "Accounts failed to log on"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_SecurityInfoNotableIssues|AccountsFailedToLogon"
  query                      = "SecurityEvent | where EventID == 4625 | summarize count() by TargetAccount"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-64" {
  category                   = "Security Info Notable Issues"
  display_name               = "Accounts failed to login (Linux)"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_SecurityInfoNotableIssues|Auditd_AccountsFailedToLogin"
  query                      = "LinuxAuditLog | where RecordType == 'user_login' and res != 'success' | summarize count() by acct"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-65" {
  category                   = "Security Info Notable Issues"
  display_name               = "Executed Commands (Linux)"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_SecurityInfoNotableIssues|Auditd_ExecutedCommands"
  query                      = "LinuxAuditLog | where RecordType == 'syscall' and syscall == 'execve' | summarize count() by cmd"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-66" {
  category                   = "Security Info Notable Issues"
  display_name               = "Loading or Unloading of Kernel modules (Linux)"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_SecurityInfoNotableIssues|Auditd_LoadingOrUnloadingOfKernelModules"
  query                      = "LinuxAuditLog | where key == 'kernelmodules' and RecordType != 'CONFIG_CHANGE'"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-67" {
  category                   = "Security Info Notable Issues"
  display_name               = "Distinct paths of Executed Commands (Linux)"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_SecurityInfoNotableIssues|Auditd_NumberOfDistinctLocationsOfProcessExecuted"
  query                      = "LinuxAuditLog | where RecordType == 'syscall' and syscall == 'execve' | summarize count() by exe"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-68" {
  category                   = "Security Info Notable Issues"
  display_name               = "Change or reset passwords attempts"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_SecurityInfoNotableIssues|ChangeOrResetPasswordsAttempts"
  query                      = "SecurityEvent | where EventID in (4723, 4724) | summarize count() by TargetAccount"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-69" {
  category                   = "Security Info Notable Issues"
  display_name               = "Computers with cleaned event logs"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_SecurityInfoNotableIssues|ComputersWithCleanedEventLogs"
  query                      = "SecurityEvent | where EventID in (1102, 517) and EventSourceName == 'Microsoft-Windows-Eventlog' | summarize count() by Computer"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-70" {
  category                   = "Security Info Notable Issues"
  display_name               = "Computers with failed Linux user password change"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_SecurityInfoNotableIssues|ComputersWithFailedLinuxUserPasswordChange"
  query                      = "Syslog | where Facility == 'authpriv' and ((SyslogMessage has 'passwd:chauthtok' and SyslogMessage has 'authentication failure') or SyslogMessage has 'password change failed') | summarize count() by Computer"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-71" {
  category                   = "Security Info Notable Issues"
  display_name               = "Computers with failed ssh logons"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_SecurityInfoNotableIssues|ComputersWithFailedSshLogons"
  query                      = "Syslog | where (Facility == 'authpriv' and SyslogMessage has 'sshd:auth' and SyslogMessage has 'authentication failure') or (Facility == 'auth' and ((SyslogMessage has 'Failed' and SyslogMessage has 'invalid user' and SyslogMessage has 'ssh2') or SyslogMessage has 'error: PAM: Authentication failure')) | summarize count() by Computer"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-72" {
  category                   = "Security Info Notable Issues"
  display_name               = "Computers with failed su logons"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_SecurityInfoNotableIssues|ComputersWithFailedSuLogons"
  query                      = "Syslog | where (Facility == 'authpriv' and SyslogMessage has 'su:auth' and SyslogMessage has 'authentication failure') or (Facility == 'auth' and SyslogMessage has 'FAILED SU') | summarize count() by Computer"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-73" {
  category                   = "Security Info Notable Issues"
  display_name               = "Computers with failed sudo logons"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_SecurityInfoNotableIssues|ComputersWithFailedSudoLogons"
  query                      = "Syslog | where (Facility == 'authpriv' and SyslogMessage has 'sudo:auth' and (SyslogMessage has 'authentication failure' or SyslogMessage has 'conversation failed')) or ((Facility == 'auth' or Facility == 'authpriv') and SyslogMessage has 'user NOT in sudoers') | summarize count() by Computer"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-74" {
  category                   = "Security Info Notable Issues"
  display_name               = "Computers with new Linux group created"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_SecurityInfoNotableIssues|ComputersWithNewLinuxGroupCreated"
  query                      = "Syslog | where Facility == 'authpriv' and SyslogMessage has 'new group' | summarize count() by Computer"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-75" {
  category                   = "Security Info Notable Issues"
  display_name               = "Computers with users added to a Linux group"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_SecurityInfoNotableIssues|ComputersWithUsersAddedToLinuxGroup"
  query                      = "Syslog | where Facility == 'authpriv' and SyslogMessage has 'to group' and (SyslogMessage has 'add' or SyslogMessage has 'added') | summarize by Computer"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-76" {
  category                   = "Security Info Notable Issues"
  display_name               = "Distinct clients resolving malicious domains"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_SecurityInfoNotableIssues|DistinctClientsResolvingMaliciousDomains"
  query                      = "let schemaColumns = datatable(ClientIP:string)[]; union isfuzzy=true schemaColumns, (DnsEvents | where SubType == 'LookupQuery' and isnotempty(MaliciousIP)) | summarize count() by ClientIP"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-77" {
  category                   = "Security Info Notable Issues"
  display_name               = "Locked accounts"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_SecurityInfoNotableIssues|LockedAccounts"
  query                      = "SecurityEvent | where EventID == 4740 | summarize count() by TargetAccount"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-78" {
  category                   = "Security Info Notable Issues"
  display_name               = "Remote procedure call(RPC) attempts"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_SecurityInfoNotableIssues|RemoteProcedureCallAttempts"
  query                      = "SecurityEvent | where EventID == 5712 | summarize count() by Computer"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-79" {
  category                   = "Security Info Notable Issues"
  display_name               = "Security groups created or modified"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_SecurityInfoNotableIssues|SecurityGroupsCreatedOrModified"
  query                      = "SecurityEvent | where EventID in (4727, 4731, 4735, 4737, 4754, 4755) | summarize count() by TargetAccount"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-80" {
  category                   = "Security Info Notable Issues"
  display_name               = "User accounts created or enabled"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_SecurityInfoNotableIssues|UserAccountsChanged"
  query                      = "SecurityEvent | where EventID in (4720, 4722) | summarize by TargetAccount"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-81" {
  category                   = "Security Warning Notable Issues"
  display_name               = "Computers missing critical updates"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_SecurityWarningNotableIssues|ComputersMissingCriticalUpdates"
  query                      = "Update | where UpdateState == 'Needed' and Optional == false and Classification == 'Critical Updates' and Approved != false | summarize count() by Computer"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-82" {
  category                   = "Security Warning Notable Issues"
  display_name               = "Computers with insufficient  protection"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_SecurityWarningNotableIssues|ComputersWithInsufficientProtection"
  query                      = "ProtectionStatus | summarize (TimeGenerated, ProtectionStatusRank) = argmax(TimeGenerated, ProtectionStatusRank) by Computer | where ProtectionStatusRank > 199 and ProtectionStatusRank != 550"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-83" {
  category                   = "Security Warning Notable Issues"
  display_name               = "Computers with system audit policy changes"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_SecurityWarningNotableIssues|ComputersWithSystemAuditPolicyChanges"
  query                      = "SecurityEvent | where EventID == 4719 | summarize count() by Computer"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-84" {
  category                   = "Security Warning Notable Issues"
  display_name               = "Domain security policy changes"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_SecurityWarningNotableIssues|DomainSecurityPolicyChanges"
  query                      = "SecurityEvent | where EventID == 4739 | summarize count() by DomainPolicyChanged"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-85" {
  category                   = "Security Warning Notable Issues"
  display_name               = "Logons with a clear text password"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_SecurityWarningNotableIssues|LogonsWithClearTextPassword"
  query                      = "SecurityEvent | where EventID == 4624 and LogonType == 8 | summarize count() by TargetAccount"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-86" {
  category                   = "Security Warning Notable Issues"
  display_name               = "Low priority AD assessment security recommendations"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_SecurityWarningNotableIssues|LowPriorityADAssessmentSecurityRecommendations"
  query                      = "let schemaColumns = datatable(TimeGenerated:datetime, RecommendationId:string)[]; union isfuzzy=true schemaColumns, (ADAssessmentRecommendation | where FocusArea == 'Security and Compliance' and RecommendationResult == 'Failed' and RecommendationScore<35) | summarize arg_max(TimeGenerated, *) by RecommendationId"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-87" {
  category                   = "Security Warning Notable Issues"
  display_name               = "Low priority SQL assessment security recommendations"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_SecurityWarningNotableIssues|LowPrioritySQLAssessmentSecurityRecommendations"
  query                      = "let schemaColumns = datatable(TimeGenerated:datetime, RecommendationId:string)[]; union isfuzzy=true schemaColumns, (SQLAssessmentRecommendation | where FocusArea == 'Security and Compliance' and RecommendationResult == 'Failed' and RecommendationScore<35) | summarize arg_max(TimeGenerated, *) by RecommendationId"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-88" {
  category                   = "Security Warning Notable Issues"
  display_name               = "Members added To security-enabled groups"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_SecurityWarningNotableIssues|MembersAddedToSecurityEnabledGroups"
  query                      = "SecurityEvent | where EventID in (4728, 4732, 4756) | summarize count() by SubjectAccount"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_saved_search" "res-89" {
  category                   = "Security Warning Notable Issues"
  display_name               = "Suspicious executables"
  log_analytics_workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  name                       = "Security(R-CSSPZ-LOGS-MAN-PRD-002)_SecurityWarningNotableIssues|SuspiciousExecutables"
  query                      = "SecurityEvent | where EventID == 8002 and Fqbn == '-' | summarize ExecutionCountHash=count() by FileHash | where ExecutionCountHash <= 5"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_application_insights" "res-746" {
  application_type    = "web"
  location            = "northeurope"
  name                = "AzureProdVM"
  resource_group_name = "R-CSSPZ-RG-MAN-PRD-009"
  sampling_percentage = 0
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
  workspace_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/R-CSSPZ-RG-MAN-PRD-009/providers/Microsoft.OperationalInsights/workspaces/R-CSSPZ-LOGS-MAN-PRD-002"
  depends_on = [
    azurerm_log_analytics_workspace.res-4,
  ]
}
resource "azurerm_log_analytics_solution" "res-747" {
  location            = "northeurope"
  resource_group_name = "r-csspz-rg-man-prd-009"
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
  workspace_name        = "r-csspz-logs-man-prd-002"
  workspace_resource_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-009/providers/Microsoft.OperationalInsights/workspaces/r-csspz-logs-man-prd-002"
  plan {
    product   = "OMSGallery/SQLAdvancedThreatProtection"
    publisher = "Microsoft"
  }
  depends_on = [
    azurerm_resource_group.res-2,
  ]
}
resource "azurerm_log_analytics_solution" "res-748" {
  location            = "northeurope"
  resource_group_name = "r-csspz-rg-man-prd-009"
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
  workspace_name        = "r-csspz-logs-man-prd-002"
  workspace_resource_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-009/providers/Microsoft.OperationalInsights/workspaces/r-csspz-logs-man-prd-002"
  plan {
    product   = "OMSGallery/SQLVulnerabilityAssessment"
    publisher = "Microsoft"
  }
  depends_on = [
    azurerm_resource_group.res-2,
  ]
}
resource "azurerm_log_analytics_solution" "res-749" {
  location            = "northeurope"
  resource_group_name = "r-csspz-rg-man-prd-009"
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
  workspace_name        = "r-csspz-logs-man-prd-002"
  workspace_resource_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-009/providers/Microsoft.OperationalInsights/workspaces/r-csspz-logs-man-prd-002"
  plan {
    product   = "OMSGallery/Security"
    publisher = "Microsoft"
  }
  depends_on = [
    azurerm_resource_group.res-2,
  ]
}
resource "azurerm_log_analytics_solution" "res-750" {
  location            = "northeurope"
  resource_group_name = "r-csspz-rg-man-prd-009"
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
  workspace_name        = "r-csspz-logs-man-prd-002"
  workspace_resource_id = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-009/providers/Microsoft.OperationalInsights/workspaces/r-csspz-logs-man-prd-002"
  plan {
    product   = "OMSGallery/SecurityCenterFree"
    publisher = "Microsoft"
  }
  depends_on = [
    azurerm_resource_group.res-2,
  ]
}
resource "azurerm_monitor_smart_detector_alert_rule" "res-751" {
  description         = "Failure Anomalies notifies you of an unusual rise in the rate of failed HTTP requests or dependency calls."
  detector_type       = "FailureAnomaliesDetector"
  frequency           = "PT1M"
  name                = "Failure Anomalies - AzureProdVM"
  resource_group_name = "r-csspz-rg-man-prd-009"
  scope_resource_ids  = ["/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourcegroups/r-csspz-rg-man-prd-009/providers/microsoft.insights/components/azureprodvm"]
  severity            = "Sev3"
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
  action_group {
    ids = ["/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/r-csspz-rg-man-prd-009/providers/Microsoft.Insights/actionGroups/application insights smart detection", "/subscriptions/b97da650-b444-4530-9f4b-968706a96e1b/resourceGroups/m-csspz-rg-soc-prd-001/providers/Microsoft.Insights/actionGroups/servicenow azure monitor sync"]
  }
  depends_on = [
    azurerm_resource_group.res-2,
  ]
}
