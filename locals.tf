# -----------------------------------------------------------------------------
# Local Values
# Computed values and commonly reused expressions
# -----------------------------------------------------------------------------

locals {
  # Computed Resource IDs
  log_analytics_workspace_id = "/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.OperationalInsights/workspaces/${var.log_analytics_workspace_name}"

  # Subscription scope for alerts
  subscription_scope = "/subscriptions/${var.subscription_id}"

  # Common tags merged with environment
  merged_common_tags = merge(var.common_tags, {
    Environment = var.environment
  })

  # Resource group tags merged with environment
  merged_rg_tags = merge(var.resource_group_tags, {
    Environment = var.environment
  })

  # Change Tracking query components
  changetracking_computers_query = join("\", \"", var.changetracking_computer_names)
  changetracking_vmuuids_query   = join("\", \"", var.changetracking_vm_uuids)
}
