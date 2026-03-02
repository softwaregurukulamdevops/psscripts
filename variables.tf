# -----------------------------------------------------------------------------
# Core Infrastructure Variables
# -----------------------------------------------------------------------------

variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
  default     = "northeurope"
}

variable "subscription_id" {
  description = "The Azure Subscription ID"
  type        = string
  default     = "6088f278-2d38-4bdd-9e08-e5417d44af11"
}

variable "resource_group_name" {
  description = "Name of the main resource group"
  type        = string
  default     = "M-CSSPZ-RG-MAN-PRD-002"
}

variable "environment" {
  description = "Environment name (e.g., PRD, DEV, UAT)"
  type        = string
  default     = "PRD"
}

# -----------------------------------------------------------------------------
# Log Analytics Workspace Variables
# -----------------------------------------------------------------------------

variable "log_analytics_workspace_name" {
  description = "Name of the Log Analytics Workspace"
  type        = string
  default     = "R-CSSPZ-LOGS-MAN-PRD-001"
}

# -----------------------------------------------------------------------------
# Data Collection Rule Variables
# -----------------------------------------------------------------------------

variable "dcr_vminsights_name" {
  description = "Name for the VM Insights Data Collection Rule"
  type        = string
  default     = "MSVMI-DefaultWorkspace-6088f278-2d38-4bdd-9e08-e5417d44af11-EUS"
}

variable "dcr_windows_name" {
  description = "Name for the Windows Data Collection Rule"
  type        = string
  default     = "R-CSSPZ-DCR-MAN-PRD-001"
}

variable "dcr_linux_name" {
  description = "Name for the Linux Data Collection Rule"
  type        = string
  default     = "R-CSSPZ-DCR-MAN-PRD-002"
}

variable "dcr_nwta_endpoint_name" {
  description = "Name for the Network Traffic Analytics Data Collection Endpoint"
  type        = string
  default     = "NWTA-cca82599-4280-4ce1-8db8-0dc465K83EQK"
}

variable "dcr_nwta_rule_name" {
  description = "Name for the Network Traffic Analytics Data Collection Rule"
  type        = string
  default     = "NWTA-cca82599-4280-4ce1-8db8-0dc465ff83be8UQIXD"
}

# -----------------------------------------------------------------------------
# User Assigned Identity Variables
# -----------------------------------------------------------------------------

variable "user_assigned_identity_name" {
  description = "Name of the User Assigned Identity"
  type        = string
  default     = "ADgroupmember"
}

# -----------------------------------------------------------------------------
# Action Groups and Alerts Variables
# -----------------------------------------------------------------------------

variable "vip_support_action_group_id" {
  description = "Resource ID for the VIP Support action group"
  type        = string
  default     = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourcegroups/r-csspz-rg-man-prd-009/providers/microsoft.insights/actiongroups/vipsupport"
}

variable "servicenow_action_group_id" {
  description = "Resource ID for the ServiceNow sync action group"
  type        = string
  default     = "/subscriptions/b97da650-b444-4530-9f4b-968706a96e1b/resourcegroups/m-csspz-rg-soc-prd-001/providers/microsoft.insights/actiongroups/servicenow azure monitor sync"
}

variable "automation_account_id" {
  description = "Resource ID for the Automation Account linked to Log Analytics"
  type        = string
  default     = "/subscriptions/6088f278-2d38-4bdd-9e08-e5417d44af11/resourceGroups/M-CSSPZ-RG-MAN-PRD-001/providers/Microsoft.Automation/automationAccounts/aut-azure-servicenow-001"
}

# -----------------------------------------------------------------------------
# Tag Variables
# -----------------------------------------------------------------------------

variable "common_tags" {
  description = "Common tags to apply to all resources"
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
}

variable "resource_group_tags" {
  description = "Tags specific to the resource group"
  type        = map(string)
  default = {
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

# -----------------------------------------------------------------------------
# Alert Webhook Properties Variables
# -----------------------------------------------------------------------------

variable "alert_webhook_properties" {
  description = "Webhook properties for alert actions"
  type        = map(string)
  default = {
    AssignmentGroup = "HCL-VIP-Support"
    Service         = "Azure Cloud Platform Application Service"
    SubType         = "TestExampleAvailableDiskSpaceAlert"
    Type            = "Capacity"
  }
}

# -----------------------------------------------------------------------------
# Security Center Automation Variables
# -----------------------------------------------------------------------------

variable "security_center_automation_name" {
  description = "Name for the Security Center Automation"
  type        = string
  default     = "ExportToWorkspace"
}

# -----------------------------------------------------------------------------
# Change Tracking Variables
# -----------------------------------------------------------------------------

variable "changetracking_computer_names" {
  description = "List of computer names for change tracking"
  type        = list(string)
  default     = []
}

variable "changetracking_vm_uuids" {
  description = "List of VM UUIDs for change tracking monitoring"
  type        = list(string)
  default = [
    "13bf2a5c-afbe-4d78-91ce-3a808d1ad04f", "5c2abf13-beaf-784d-91ce-3a808d1ad04f",
    "d6187ded-dd60-4b88-92a0-ebc2e0b51ed6", "ed7d18d6-60dd-884b-92a0-ebc2e0b51ed6",
    "6342d494-96b0-4c4b-8bee-425bb33329ba", "94d44263-b096-4b4c-8bee-425bb33329ba",
    "18b5bfb1-008f-4de8-8f81-6141de5c0cd2", "b1bfb518-8f00-e84d-8f81-6141de5c0cd2",
    "93bd1cf0-2567-4858-a691-74e5013bc68d", "f01cbd93-6725-5848-a691-74e5013bc68d",
    "b9ff7a98-2fa4-4065-b5eb-ddddba42962f", "987affb9-a42f-6540-b5eb-ddddba42962f",
    "56bf40a9-48b8-40f6-abf0-426cd94cd5ea", "a940bf56-b848-f640-abf0-426cd94cd5ea",
    "71b40635-72fc-4123-a3e4-90097822b7d2", "3506b471-fc72-2341-a3e4-90097822b7d2",
    "74b717f3-032d-42b5-8e0c-0300b160187e", "f317b774-2d03-b542-8e0c-0300b160187e",
    "93e8b191-65ec-44bb-8999-580acb07a0a2", "91b1e893-ec65-bb44-8999-580acb07a0a2",
    "df62a4b1-e51d-496b-8961-340eb3503529", "b1a462df-1de5-6b49-8961-340eb3503529",
    "adca1e92-52f2-4802-b6e1-757564b113f1", "921ecaad-f252-0248-b6e1-757564b113f1",
    "b0799d89-607c-4c69-92d2-8ced87e01d82"
  ]
}

# -----------------------------------------------------------------------------
# Data Collection Configuration Variables
# -----------------------------------------------------------------------------

variable "performance_counter_sampling_frequency" {
  description = "Sampling frequency in seconds for performance counters"
  type        = number
  default     = 60
}

variable "windows_event_log_x_path_queries" {
  description = "XPath queries for Windows Event Log collection"
  type        = list(string)
  default = [
    "Application!*[System[(Level=1 or Level=2 or Level=3)]]",
    "Security!*[System[(band(Keywords,4503599627370496))]]",
    "System!*[System[(Level=1 or Level=2 or Level=3)]]"
  ]
}

variable "syslog_facility_names" {
  description = "Facility names for syslog collection"
  type        = list(string)
  default = [
    "auth", "authpriv", "cron", "daemon", "mark", "kern",
    "local0", "local1", "local2", "local3", "local4", "local5", "local6", "local7",
    "lpr", "mail", "news", "syslog", "user", "uucp"
  ]
}

variable "syslog_log_levels" {
  description = "Log levels for syslog collection"
  type        = list(string)
  default     = ["Warning", "Error", "Critical", "Alert", "Emergency"]
}

# -----------------------------------------------------------------------------
# Log Analytics Solutions Variables
# -----------------------------------------------------------------------------

variable "log_analytics_solutions" {
  description = "List of Log Analytics solutions to deploy"
  type        = list(string)
  default     = ["ChangeTracking", "SecurityCenterFree", "SQLAdvancedThreatProtection", "SQLVulnerabilityAssessment", "Security"]
}

# -----------------------------------------------------------------------------
# Activity Log Alert Variables
# -----------------------------------------------------------------------------

variable "vm_health_alert_name" {
  description = "Name for the VM health status alert"
  type        = string
  default     = "Azure Prod VM Health Status Degraded"
}

variable "vm_health_alert_description" {
  description = "Description for the VM health status alert"
  type        = string
  default     = "Azure Prod VM Health Status Degraded"
}

variable "vm_health_current_statuses" {
  description = "Current health statuses that trigger the VM health alert"
  type        = list(string)
  default     = ["Degraded", "Unavailable"]
}

variable "vm_health_previous_statuses" {
  description = "Previous health statuses for the VM health alert"
  type        = list(string)
  default     = ["Available"]
}

variable "service_health_alert_name" {
  description = "Name for the service health alert"
  type        = string
  default     = "Service Health Alerts"
}

variable "service_health_events" {
  description = "Service health event types to monitor"
  type        = list(string)
  default     = ["Incident", "Maintenance", "Informational", "ActionRequired", "Security"]
}

variable "service_health_locations" {
  description = "Locations to monitor for service health"
  type        = list(string)
  default     = ["Global"]
}

# -----------------------------------------------------------------------------
# Security Center Automation Variables
# -----------------------------------------------------------------------------

variable "security_assessment_severities" {
  description = "Security assessment severity levels to monitor"
  type        = list(string)
  default     = ["High", "Medium", "Low"]
}

variable "security_alert_severities" {
  description = "Security alert severity levels to monitor (lowercase)"
  type        = list(string)
  default     = ["high", "medium", "low"]
}

variable "security_event_sources" {
  description = "Security event sources to monitor"
  type        = list(string)
  default = [
    "SubAssessments",
    "Assessments",
    "Alerts",
    "SecureScores",
    "SecureScoreControls",
    "RegulatoryComplianceAssessment",
    "SecureScoresSnapshot",
    "SecureScoreControlsSnapshot",
    "RegulatoryComplianceAssessmentSnapshot",
    "AssessmentsSnapshot",
    "SubAssessmentsSnapshot"
  ]
}

# -----------------------------------------------------------------------------
# Log Analytics Saved Search Variables
# -----------------------------------------------------------------------------

variable "saved_search_categories" {
  description = "Categories for Log Analytics saved searches"
  type = object({
    change_tracking          = string
    general_exploration      = string
    log_management           = string
    security                 = string
    security_critical_issues = string
    security_info_issues     = string
    security_warning_issues  = string
  })
  default = {
    change_tracking          = "Change Tracking"
    general_exploration      = "General Exploration"
    log_management           = "Log Management"
    security                 = "Security"
    security_critical_issues = "Security Critical Notable Issues"
    security_info_issues     = "Security Info Notable Issues"
    security_warning_issues  = "Security Warning Notable Issues"
  }
}

variable "enable_saved_searches" {
  description = "Enable or disable Log Analytics saved searches"
  type        = bool
  default     = true
}
