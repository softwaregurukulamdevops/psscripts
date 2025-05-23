provider "azurerm" {
  features {}
}

# === POLICY 1: DENY VM CREATION IF 'operational_schedule' TAG IS MISSING ===
resource "azurerm_policy_definition" "deny_missing_operational_schedule_tag" {
  name         = "deny-vm-without-operational-schedule-tag"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deny VM creation without operational_schedule tag"
  management_group_id = "/providers/Microsoft.Management/managementGroups/my-management-group"

  policy_rule = jsonencode({
    "if": {
      "allOf": [
        {
          "field": "type",
          "equals": "Microsoft.Compute/virtualMachines"
        },
        {
          "field": "tags['operational_schedule']",
          "exists": "false"
        }
      ]
    },
    "then": {
      "effect": "deny"
    }
  })

  metadata = jsonencode({
    "version"  = "1.0.0",
    "category" = "Tags"
  })
}

resource "azurerm_policy_assignment" "assign_deny_policy" {
  name                 = "deny-vm-missing-operational-schedule"
  display_name         = "Deny VM creation without operational_schedule tag"
  policy_definition_id = azurerm_policy_definition.deny_missing_operational_schedule_tag.id
  management_group_id  = "/providers/Microsoft.Management/managementGroups/my-management-group"
  enforcement_mode     = "Default"
}

# === POLICY 2: AUDIT VMs WITH TAG AND ADD TAG VALUE IF PRESENT ===
resource "azurerm_policy_definition" "audit_and_modify_operational_schedule" {
  name         = "audit-and-modify-operational-schedule-tag"
  policy_type  = "Custom"
  mode         = "Indexed"
  display_name = "Audit and modify operational_schedule tag if present"
  management_group_id = "/providers/Microsoft.Management/managementGroups/my-management-group"

  policy_rule = jsonencode({
    "if": {
      "allOf": [
        {
          "field": "type",
          "equals": "Microsoft.Compute/virtualMachines"
        },
        {
          "field": "tags['operational_schedule']",
          "exists": "true"
        }
      ]
    },
    "then": {
      "effect": "modify",
      "details": {
        "roleDefinitionIds": [
          "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"# Contributor role
        ],
        "operations": [
          {
            "operation": "addOrReplace",
            "field": "tags['operational_schedule']",
            "value": "PLACEHOLDER"
          }
        ]
      }
    }
  })

  metadata = jsonencode({
    "version"  = "1.0.0",
    "category" = "Tags"
  })
}

resource "azurerm_policy_assignment" "assign_audit_modify_policy" {
  name                 = "audit-and-modify-operational-schedule"
  display_name         = "Audit and enforce operational_schedule tag value"
  policy_definition_id = azurerm_policy_definition.audit_and_modify_operational_schedule.id
  management_group_id  = "/providers/Microsoft.Management/managementGroups/my-management-group"
  enforcement_mode     = "Default"
}
