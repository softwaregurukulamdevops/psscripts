resource "azurerm_policy_definition" "dfc_vm_tag_policy" {
  name         = "dfc_vm_tag_policy_def"
  policy_type  = "Custom"
  mode         = "Indexed"
  display_name = "R-CSSPZ-POL-BOIPROD-DEF-Add tags to Virtual Machines"
  description  = "Adds specified tags and values to Azure Virtual Machines if they are missing. Existing resources can be remediated. Tags are only added if not present; existing tags with different values are not overwritten."
 
  metadata = jsonencode({
    version  = "1.0.2"
    category = "Tags"
  })
 
  parameters = jsonencode({
    "Environment": {
      "type": "String",
      "metadata": {
        "displayName": "Environment Tag",
        "description": "Environment tag (e.g., Production, Dev)"
      }
    },
    "Operational_Schedule": {
      "type": "String",
      "metadata": {
        "displayName": "Operational Schedule Tag",
        "description": "Operational Schedule (e.g., 24x7, 9-5)"
      }
    }
  })
 
  policy_rule = jsonencode({
    "if": {
      "allOf": [
        {
          "equals": "Microsoft.Compute/virtualMachines",
          "field": "type"
        },
        {
          "anyOf": [
            {
              "field": "tags[Environment]",
              "exists": false
            },
            {
              "field": "tags[Operational_Schedule]",
              "exists": false
            }
          ]
        }
      ]
    },
    "then": {
      "effect": "modify",
      "details": {
        "roleDefinitionIds": [
          "/providers/microsoft.authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
        ],
        "operations": [
          {
            "operation": "add",
            "field": "tags[Environment]",
            "value": "[parameters('Environment')]"
          },
          {
            "operation": "add",
            "field": "tags[Operational_Schedule]",
            "value": "[parameters('Operational_Schedule')]"
          }
        ]
      }
    }
  })
}
 
# Policy assignment at the subscription level
resource "azurerm_subscription_policy_assignment" "dfc_vm_tag_policy_asg" {
  name                 = "dfc_vm_tag_policy_asg"
  display_name         = "R-CSSPZ-POL-BOIPROD-ASG-Add tags to Virtual Machines"
  policy_definition_id = azurerm_policy_definition.dfc_vm_tag_policy.id
  location             = "North Europe"
  subscription_id      = "/subscriptions/${data.azurerm_subscription.current.subscription_id}"  # ✅ Fix here
 
  identity {
    type         = "UserAssigned"
   identity_ids = [
  "/subscriptions/3bc8f069-65c7-4d08-b8de-534c20e56c38/resourceGroups/Amboge/providers/Microsoft.ManagedIdentity/userAssignedIdentities/policy_identity"
]
 
  }
 
  parameters = jsonencode({
    "Environment": {
      "value": "Production"
    },
    "Operational_Schedule": {
      "value": "24x7"
    }
  })
}
