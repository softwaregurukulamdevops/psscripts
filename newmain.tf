resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

#------------------------------------------------------------
# Update Manager Policy: Periodic Update Checks on VMs
#------------------------------------------------------------
resource "azurerm_policy_definition" "update_manager_periodic_checks" {
  name         = "Configure-Periodic-Update-Check"
  policy_type  = "Custom"
  mode         = "Indexed"
  display_name = "Configure periodic update checks on Azure VMs"

  policy_rule = <<POLICY
{
  "if": {
    "field": "type",
    "equals": "Microsoft.Compute/virtualMachines"
  },
  "then": {
    "effect": "auditIfNotExists",
    "details": {
      "type": "Microsoft.Automation/automationAccounts/softwareUpdateConfigurations",
      "existenceCondition": {
        "field": "Microsoft.Automation/softwareUpdateConfigurations/updateConfiguration.scheduleInfo.frequency",
        "equals": "Week"
      }
    }
  }
}
POLICY

  metadata = <<METADATA
{
  "category": "Update Management"
}
METADATA
}

resource "azurerm_policy_assignment" "assign_update_check" {
  name                 = "assign-periodic-update-check"
  policy_definition_id = azurerm_policy_definition.update_manager_periodic_checks.id
  scope                = data.azurerm_subscription.primary.id
}

#------------------------------------------------------------
# Network Watcher + Flow Logs with Traffic Analytics
#------------------------------------------------------------
resource "azurerm_network_watcher" "watcher" {
  name                = "network-watcher"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_log_analytics_workspace" "log_analytics" {
  name                = "law-network-analytics"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_network_watcher_flow_log" "flow_log" {
  name                      = "nsg-flow-logs"
  network_watcher_name      = azurerm_network_watcher.watcher.name
  resource_group_name       = azurerm_resource_group.main.name
  network_security_group_id = var.nsg_id
  storage_account_id        = var.storage_account_id
  enabled                   = true

  traffic_analytics {
    enabled               = true
    workspace_id          = azurerm_log_analytics_workspace.log_analytics.workspace_id
    workspace_region      = var.location
    workspace_resource_id = azurerm_log_analytics_workspace.log_analytics.id
  }
}

#------------------------------------------------------------
# Recovery Vault Redundancy Restriction
#------------------------------------------------------------
resource "azurerm_policy_definition" "deny_redundancy" {
  name         = "deny-recovery-vault-specific-redundancy"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deny creation of Recovery Vaults with GRS"

  policy_rule = <<POLICY
{
  "if": {
    "allOf": [
      {
        "field": "type",
        "equals": "Microsoft.RecoveryServices/vaults"
      },
      {
        "field": "Microsoft.RecoveryServices/vaults/storageModelType",
        "equals": "GeoRedundant"
      }
    ]
  },
  "then": {
    "effect": "deny"
  }
}
POLICY

  metadata = <<METADATA
{
  "category": "Backup"
}
METADATA
}

resource "azurerm_policy_assignment" "deny_redundancy_assignment" {
  name                 = "deny-redundancy-policy"
  policy_definition_id = azurerm_policy_definition.deny_redundancy.id
  scope                = data.azurerm_subscription.primary.id
}
