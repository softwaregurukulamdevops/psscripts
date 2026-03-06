# Local tags definitions for tag management and merging
locals {
  tags_vm_extension           = merge(var.common_tags, var.tags_vm_extension)
  tags_managed_identity       = merge(var.common_tags, var.tags_managed_identity)
  tags_network_interface      = merge(var.common_tags, var.tags_network_interface)
  tags_network_security_group = merge(var.common_tags, var.tags_network_security_group)
  tags_public_ip              = merge(var.common_tags, var.tags_public_ip)
  tags_recovery_vault         = merge(var.common_tags, var.tags_recovery_vault)
  tags_backup_policy          = merge(var.common_tags, var.tags_backup_policy)
  tags_automation_account     = merge(var.common_tags, var.tags_automation_account)
  tags_automation_schedule    = merge(var.common_tags, var.tags_automation_schedule)
  tags_automation_runbook     = merge(var.common_tags, var.tags_automation_runbook)
  tags_automation_module      = merge(var.common_tags, var.tags_automation_module)
  tags_maintenance_config     = merge(var.common_tags, var.tags_maintenance_config)
  tags_alert                  = merge(var.common_tags, var.tags_alert)
  tags_managed_disk           = merge(var.common_tags, var.tags_managed_disk)
  tags_virtual_machine        = merge(var.common_tags, var.tags_virtual_machine)
}

resource "azurerm_resource_group" "res-0" {
  location = var.location
  name     = var.resource_group_name
  tags     = var.common_tags
}
resource "azurerm_virtual_machine_extension" "res-1" {
  auto_upgrade_minor_version = true
  name                       = var.vm_extension_mde_name
  publisher                  = var.vm_extension_mde_publisher
  settings = jsonencode({
    autoUpdate        = var.vm_extension_mde_auto_update
    azureResourceId   = "/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.Compute/virtualMachines/${var.vm_cyberark_name}"
    forceReOnboarding = var.vm_extension_mde_force_reonboarding
    vNextEnabled      = var.vm_extension_mde_vnext_enabled
  })
  tags                 = local.tags_vm_extension
  type                 = var.vm_extension_mde_name
  type_handler_version = "1.0"
  virtual_machine_id   = "/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.Compute/virtualMachines/${var.vm_cyberark_name}"
  depends_on = [
    azurerm_windows_virtual_machine.res-451,
  ]
}
resource "azurerm_user_assigned_identity" "res-2" {
  location            = var.location
  name                = var.managed_identity_name
  resource_group_name = var.resource_group_name
  tags                = local.tags_managed_identity
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_federated_identity_credential" "res-3" {
  audience            = [var.federated_identity_audience]
  issuer              = var.devops_issuer_url
  name                = var.federated_identity_name
  parent_id           = "/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/${var.managed_identity_name}"
  resource_group_name = var.resource_group_name
  subject             = var.devops_subject
  depends_on = [
    azurerm_user_assigned_identity.res-2,
  ]
}
resource "azurerm_federated_identity_credential" "res-4" {
  audience            = [var.federated_identity_audience]
  issuer              = var.devops_issuer_url
  name                = var.managed_identity_name
  parent_id           = "/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/${var.managed_identity_name}"
  resource_group_name = var.resource_group_name
  subject             = var.devops_subject
  depends_on = [
    azurerm_user_assigned_identity.res-2,
  ]
}
resource "azurerm_network_interface" "res-5" {
  location            = var.location
  name                = var.network_interface_names["ovoc_image"]
  resource_group_name = var.resource_group_name
  tags                = local.tags_network_interface
  ip_configuration {
    name                          = var.ip_configuration_name
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = "/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name_vnet}/providers/Microsoft.Network/virtualNetworks/${var.vnet_name}/subnets/${var.subnet_names["fgt_subnet"]}"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_network_interface_security_group_association" "res-6" {
  network_interface_id      = "/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.Network/networkInterfaces/${var.network_interface_names["ovoc_image"]}"
  network_security_group_id = "/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.Network/networkSecurityGroups/${var.nsg_names["ovoc_image"]}"
  depends_on = [
    azurerm_network_interface.res-5,
    azurerm_network_security_group.res-10,
  ]
}
resource "azurerm_network_interface" "res-7" {
  accelerated_networking_enabled = true
  location                       = var.location
  name                           = var.network_interface_names["cyberark"]
  resource_group_name            = var.resource_group_name
  tags                           = local.tags_network_interface
  ip_configuration {
    name                          = var.ip_configuration_name
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = "/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name_vnet}/providers/Microsoft.Network/virtualNetworks/${var.vnet_name}/subnets/${var.subnet_names["cyberark_subnet"]}"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_network_interface" "res-8" {
  location            = var.location
  name                = var.network_interface_names["snowsync"]
  resource_group_name = var.resource_group_name
  tags                = local.tags_network_interface
  ip_configuration {
    name                          = var.ip_configuration_name
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.Network/publicIPAddresses/${var.public_ip_name}"
    subnet_id                     = "/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name_vnet}/providers/Microsoft.Network/virtualNetworks/${var.vnet_name}/subnets/${var.subnet_names["man_subnet"]}"
  }
  depends_on = [
    azurerm_public_ip.res-19,
  ]
}
resource "azurerm_network_interface_security_group_association" "res-9" {
  network_interface_id      = "/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.Network/networkInterfaces/${var.network_interface_names["snowsync"]}"
  network_security_group_id = "/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.Network/networkSecurityGroups/${var.nsg_names["snowsync"]}"
  depends_on = [
    azurerm_network_interface.res-8,
    azurerm_network_security_group.res-15,
  ]
}
resource "azurerm_network_security_group" "res-10" {
  location            = var.location
  name                = var.nsg_names["ovoc_image"]
  resource_group_name = var.resource_group_name
  tags                = local.tags_network_security_group
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_network_security_rule" "res-11" {
  access                      = var.nsg_rules["https"].access
  destination_address_prefix  = var.nsg_rules["https"].destination_address_prefix
  destination_port_range      = var.nsg_rules["https"].destination_port_range
  direction                   = var.nsg_rules["https"].direction
  name                        = "HTTPS"
  network_security_group_name = var.nsg_names["ovoc_image"]
  priority                    = var.nsg_rules["https"].priority
  protocol                    = var.nsg_rules["https"].protocol
  resource_group_name         = var.resource_group_name
  source_address_prefix       = var.nsg_rules["https"].source_address_prefix
  source_port_range           = var.nsg_rules["https"].source_port_range
  depends_on = [
    azurerm_network_security_group.res-10,
  ]
}
resource "azurerm_network_security_rule" "res-12" {
  access                      = var.nsg_rules["ssh"].access
  destination_address_prefix  = var.nsg_rules["ssh"].destination_address_prefix
  destination_port_range      = var.nsg_rules["ssh"].destination_port_range
  direction                   = var.nsg_rules["ssh"].direction
  name                        = "SSH"
  network_security_group_name = var.nsg_names["ovoc_image"]
  priority                    = var.nsg_rules["ssh"].priority
  protocol                    = var.nsg_rules["ssh"].protocol
  resource_group_name         = var.resource_group_name
  source_address_prefix       = var.nsg_rules["ssh"].source_address_prefix
  source_port_range           = var.nsg_rules["ssh"].source_port_range
  depends_on = [
    azurerm_network_security_group.res-10,
  ]
}
resource "azurerm_network_security_group" "res-13" {
  location            = var.location
  name                = var.nsg_names["cyberark_001"]
  resource_group_name = var.resource_group_name
  tags                = local.tags_network_security_group
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_network_security_group" "res-14" {
  location            = var.location
  name                = var.nsg_names["cyberark_002"]
  resource_group_name = var.resource_group_name
  tags                = local.tags_network_security_group
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_network_security_group" "res-15" {
  location            = var.location
  name                = var.nsg_names["snowsync"]
  resource_group_name = var.resource_group_name
  tags                = local.tags_network_security_group
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_network_security_group" "res-16" {
  location            = var.location
  name                = var.nsg_names["cyberark_backup_001"]
  resource_group_name = var.resource_group_name
  tags                = local.tags_network_security_group
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_network_security_group" "res-17" {
  location            = var.location
  name                = var.nsg_names["cyberark_backup_002"]
  resource_group_name = var.resource_group_name
  tags                = local.tags_network_security_group
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_network_security_group" "res-18" {
  location            = var.location
  name                = var.nsg_names["cyberark_backup_003"]
  resource_group_name = var.resource_group_name
  tags                = local.tags_network_security_group
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_public_ip" "res-19" {
  allocation_method   = "Static"
  location            = var.location
  name                = var.public_ip_name
  resource_group_name = var.resource_group_name
  sku                 = var.public_ip_sku
  tags                = local.tags_public_ip
  zones               = var.public_ip_availability_zones
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_recovery_services_vault" "res-20" {
  location            = var.location
  name                = var.recovery_vault_name
  resource_group_name = var.resource_group_name
  sku                 = var.recovery_vault_sku
  tags                = local.tags_recovery_vault
  identity {
    type = "SystemAssigned"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_backup_policy_vm" "res-21" {
  name                = var.backup_policy_default_name
  recovery_vault_name = var.recovery_vault_name
  resource_group_name = var.resource_group_name
  backup {
    frequency = var.backup_frequency_daily
    time      = var.backup_time
  }
  retention_daily {
    count = var.backup_daily_retention_count
  }
  depends_on = [
    azurerm_recovery_services_vault.res-20,
  ]
}
resource "azurerm_backup_policy_vm" "res-22" {
  name                = var.backup_policy_enhanced_name
  policy_type         = "V2"
  recovery_vault_name = var.recovery_vault_name
  resource_group_name = var.resource_group_name
  backup {
    frequency     = var.backup_frequency_hourly
    hour_duration = var.backup_policy_hour_duration
    hour_interval = var.backup_policy_hour_interval
    time          = var.backup_policy_enhanced_time
  }
  retention_daily {
    count = var.backup_daily_retention_count
  }
  depends_on = [
    azurerm_recovery_services_vault.res-20,
  ]
}
resource "azurerm_backup_policy_vm_workload" "res-23" {
  name                = var.backup_policy_names["hourly_log_backup"]
  recovery_vault_name = var.recovery_vault_name
  resource_group_name = var.backup_policy_resource_group_name
  workload_type       = "SQLDataBase"
  protection_policy {
    policy_type = "Log"
    backup {
      frequency_in_minutes = var.backup_policy_log_frequency_minutes
    }
    simple_retention {
      count = var.backup_policy_log_retention_count
    }
  }
  protection_policy {
    policy_type = "Full"
    backup {
      frequency = "Daily"
      time      = var.backup_times["sql_backup_default"]
    }
    retention_daily {
      count = var.backup_policy_sql_retention_count
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
  name                = var.backup_policy_names["sql_backup_default"]
  recovery_vault_name = var.recovery_vault_name
  resource_group_name = var.backup_policy_resource_group_name
  workload_type       = "SQLDataBase"
  protection_policy {
    policy_type = "Full"
    backup {
      frequency = "Daily"
      time      = var.backup_policy_sql_backup_time
    }
    retention_daily {
      count = var.backup_policy_sql_retention_count
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
  name                = var.backup_policy_names["vm_backup_default"]
  recovery_vault_name = var.recovery_vault_name
  resource_group_name = var.backup_policy_resource_group_name
  backup {
    frequency = "Daily"
    time      = var.backup_times["vm_backup_default"]
  }
  retention_daily {
    count = var.backup_policy_vm_default_retention_count
  }
  depends_on = [
    azurerm_recovery_services_vault.res-20,
  ]
}
resource "azurerm_backup_policy_vm" "res-26" {
  name                = var.backup_policy_names["vm_backup_enhanced"]
  policy_type         = "V2"
  recovery_vault_name = var.recovery_vault_name
  resource_group_name = var.backup_policy_resource_group_name
  backup {
    frequency = "Daily"
    time      = var.backup_times["vm_backup_default"]
  }
  retention_daily {
    count = var.backup_policy_vm_enhanced_retention_count
  }
  depends_on = [
    azurerm_recovery_services_vault.res-20,
  ]
}
resource "azurerm_monitor_activity_log_alert" "res-30" {
  name                = var.activity_log_alert_name
  resource_group_name = var.resource_group_name
  scopes              = ["/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.Compute/virtualMachines/${var.vm_cyberark_name}"]
  tags                = local.tags_alert
  action {
    action_group_id = var.action_group_id
    webhook_properties = {
      AssignmentGroup = var.activity_log_alert_webhook_group
      Service         = var.activity_log_alert_webhook_service
      SubType         = var.activity_log_alert_webhook_subtype
      Type            = var.activity_log_alert_webhook_type
    }
  }
  criteria {
    category = var.activity_log_alert_category
  }
  depends_on = [
    azurerm_windows_virtual_machine.res-451,
  ]
}
resource "azurerm_automation_account" "res-31" {
  location            = var.location
  name                = var.automation_account_name
  resource_group_name = var.resource_group_name
  sku_name            = var.automation_account_sku
  tags                = local.tags_automation_account
  identity {
    identity_ids = ["/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name_identity}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/${var.managed_identity_identity_only_name}"]
    type         = "SystemAssigned, UserAssigned"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_automation_connection_type" "res-32" {
  automation_account_name = var.automation_account_name
  is_global               = true
  name                    = "Azure"
  resource_group_name     = var.resource_group_name
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
  automation_account_name = var.automation_account_name
  is_global               = true
  name                    = "AzureClassicCertificate"
  resource_group_name     = var.resource_group_name
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
  automation_account_name = var.automation_account_name
  is_global               = true
  name                    = "AzureServicePrincipal"
  resource_group_name     = var.resource_group_name
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
  automation_account_name = var.automation_account_name
  parameters = {
    action   = "start"
    tagname  = var.automation_job_schedule_tag_name
    tagvalue = var.automation_job_schedule_tag_values["csspz_autoshutdown"]
  }
  resource_group_name = var.resource_group_name
  runbook_name        = var.automation_runbook_names["vm_start_stop"]
  schedule_name       = var.automation_schedule_names["csspz_autoshutdown_patch_start"]
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_job_schedule" "res-312" {
  automation_account_name = var.automation_account_name
  parameters = {
    action   = "start"
    tagname  = var.automation_job_schedule_tag_name
    tagvalue = var.automation_job_schedule_tag_values["csspz_ie_office_hours"]
  }
  resource_group_name = var.resource_group_name
  runbook_name        = var.automation_runbook_names["vm_start_stop"]
  schedule_name       = var.automation_schedule_names["csspz_ie_office_hours_start"]
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_job_schedule" "res-313" {
  automation_account_name = var.automation_account_name
  parameters = {
    action   = "start"
    tagname  = var.automation_job_schedule_tag_name
    tagvalue = var.automation_job_schedule_tag_values["csspz_india_office_hours"]
  }
  resource_group_name = var.resource_group_name
  runbook_name        = var.automation_runbook_names["vm_start_stop"]
  schedule_name       = var.automation_schedule_names["csspz_india_office_hours_start"]
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_job_schedule" "res-314" {
  automation_account_name = var.automation_account_name
  parameters = {
    action   = "start"
    tagname  = var.automation_job_schedule_tag_name
    tagvalue = var.automation_job_schedule_tag_values["csspz_ie_office_hours"]
  }
  resource_group_name = var.resource_group_name
  runbook_name        = var.automation_runbook_names["vm_start_stop"]
  schedule_name       = var.automation_schedule_names["csspz_ie_office_hours_patch_start"]
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_job_schedule" "res-315" {
  automation_account_name = var.automation_account_name
  parameters = {
    action   = "stop"
    tagname  = var.automation_job_schedule_tag_name
    tagvalue = var.automation_job_schedule_tag_values["csspz_ie_office_hours"]
  }
  resource_group_name = var.resource_group_name
  runbook_name        = var.automation_runbook_names["vm_start_stop"]
  schedule_name       = var.automation_schedule_names["csspz_ie_office_hours_patch_stop"]
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_job_schedule" "res-316" {
  automation_account_name = var.automation_account_name
  parameters = {
    action   = "stop"
    tagname  = var.automation_job_schedule_tag_name
    tagvalue = var.automation_job_schedule_tag_values["csspz_india_office_hours"]
  }
  resource_group_name = var.resource_group_name
  runbook_name        = var.automation_runbook_names["vm_start_stop"]
  schedule_name       = var.automation_schedule_names["csspz_india_office_hours_stop"]
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_job_schedule" "res-317" {
  automation_account_name = var.automation_account_name
  parameters = {
    action   = "stop"
    tagname  = var.automation_job_schedule_tag_name
    tagvalue = var.automation_job_schedule_tag_values["csspz_ie_office_hours"]
  }
  resource_group_name = var.resource_group_name
  runbook_name        = var.automation_runbook_names["vm_start_stop"]
  schedule_name       = var.automation_schedule_names["csspz_ie_office_hours_stop"]
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_job_schedule" "res-318" {
  automation_account_name = var.automation_account_name
  parameters = {
    action   = "stop"
    tagname  = var.automation_job_schedule_tag_name
    tagvalue = var.automation_job_schedule_tag_values["csspz_eu_office_hours"]
  }
  resource_group_name = var.resource_group_name
  runbook_name        = var.automation_runbook_names["vm_start_stop"]
  schedule_name       = var.automation_schedule_names["csspz_eu_office_hours_stop"]
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_job_schedule" "res-319" {
  automation_account_name = var.automation_account_name
  resource_group_name     = var.resource_group_name
  runbook_name            = var.automation_runbook_names["tag_policy_remediation"]
  schedule_name           = var.automation_schedule_names["tagpolicy_remediation_runbook_prd_schedule"]
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_job_schedule" "res-320" {
  automation_account_name = var.automation_account_name
  parameters = {
    action   = "stop"
    tagname  = var.automation_job_schedule_tag_name
    tagvalue = var.automation_job_schedule_tag_values["csspz_eu_office_hours"]
  }
  resource_group_name = var.resource_group_name
  runbook_name        = var.automation_runbook_names["vm_start_stop"]
  schedule_name       = var.automation_schedule_names["csspz_eu_office_hours_patch_stop"]
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_job_schedule" "res-321" {
  automation_account_name = var.automation_account_name
  resource_group_name     = var.resource_group_name
  runbook_name            = var.automation_runbook_names["aum_attach_vm"]
  schedule_name           = var.automation_schedule_names["csspz_workload_mw_patchnightly_12pm"]
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_job_schedule" "res-322" {
  automation_account_name = var.automation_account_name
  parameters = {
    action   = "stop"
    tagname  = var.automation_job_schedule_tag_name
    tagvalue = var.automation_job_schedule_tag_values["csspz_india_office_hours"]
  }
  resource_group_name = var.resource_group_name
  runbook_name        = var.automation_runbook_names["vm_start_stop"]
  schedule_name       = var.automation_schedule_names["csspz_india_office_hours_patch_stop"]
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_job_schedule" "res-323" {
  automation_account_name = var.automation_account_name
  resource_group_name     = var.resource_group_name
  runbook_name            = var.automation_runbook_names["aum_attach_vm"]
  schedule_name           = var.automation_schedule_names["csspz_workload_mw_patchnightly_12am"]
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_job_schedule" "res-324" {
  automation_account_name = var.automation_account_name
  parameters = {
    action   = "stop"
    tagname  = var.automation_job_schedule_tag_name
    tagvalue = var.automation_job_schedule_tag_values["csspz_autoshutdown"]
  }
  resource_group_name = var.resource_group_name
  runbook_name        = var.automation_runbook_names["vm_start_stop"]
  schedule_name       = var.automation_schedule_names["csspz_autoshutdown_patch_stop"]
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_job_schedule" "res-325" {
  automation_account_name = var.automation_account_name
  parameters = {
    action   = "stop"
    tagname  = var.automation_job_schedule_tag_name
    tagvalue = var.automation_job_schedule_tag_values["csspz_autoshutdown"]
  }
  resource_group_name = var.resource_group_name
  runbook_name        = var.automation_runbook_names["vm_start_stop"]
  schedule_name       = var.automation_schedule_names["csspz_autoshutdown_stop"]
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_job_schedule" "res-326" {
  automation_account_name = var.automation_account_name
  parameters = {
    action   = "start"
    tagname  = var.automation_job_schedule_tag_name
    tagvalue = var.automation_job_schedule_tag_values["csspz_india_office_hours"]
  }
  resource_group_name = var.resource_group_name
  runbook_name        = var.automation_runbook_names["vm_start_stop"]
  schedule_name       = var.automation_schedule_names["csspz_india_office_hours_patch_start"]
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_job_schedule" "res-327" {
  automation_account_name = var.automation_account_name
  parameters = {
    action   = "start"
    tagname  = var.automation_job_schedule_tag_name
    tagvalue = var.automation_job_schedule_tag_values["csspz_eu_office_hours"]
  }
  resource_group_name = var.resource_group_name
  runbook_name        = var.automation_runbook_names["vm_start_stop"]
  schedule_name       = var.automation_schedule_names["csspz_eu_office_hours_patch_start"]
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_job_schedule" "res-328" {
  automation_account_name = var.automation_account_name
  parameters = {
    action   = "start"
    tagname  = var.automation_job_schedule_tag_name
    tagvalue = var.automation_job_schedule_tag_values["csspz_eu_office_hours"]
  }
  resource_group_name = var.resource_group_name
  runbook_name        = var.automation_runbook_names["vm_start_stop"]
  schedule_name       = var.automation_schedule_names["csspz_eu_office_hours_start"]
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-329" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[0]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["AuditPolicyDsc"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-330" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[1]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-331" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[2]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.Accounts"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-332" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[3]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.Advisor"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-333" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[4]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.Aks"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-334" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[5]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.AnalysisServices"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-335" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[6]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.ApiManagement"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-336" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[7]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.AppConfiguration"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-337" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[8]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.ApplicationInsights"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-338" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[9]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.Attestation"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-339" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[10]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.Automation"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-340" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[11]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.Batch"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-341" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[12]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.Billing"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-342" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[13]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.Cdn"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-343" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[14]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.CloudService"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-344" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[15]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.CognitiveServices"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-345" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[16]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.Compute"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-346" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[17]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.ContainerInstance"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-347" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[18]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.ContainerRegistry"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-348" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[19]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.CosmosDB"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-349" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[20]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.DataBoxEdge"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-350" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[21]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.DataFactory"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-351" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[22]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.DataLakeAnalytics"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-352" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[23]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.DataLakeStore"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-353" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[24]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.DataShare"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-354" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[25]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.Databricks"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-355" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[26]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.DeploymentManager"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-356" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[27]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.DesktopVirtualization"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-357" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[28]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.DevTestLabs"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-358" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[29]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.Dns"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-359" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[30]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.EventGrid"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-360" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[31]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.EventHub"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-361" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[32]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.FrontDoor"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-362" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[33]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.Functions"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-363" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[34]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.HDInsight"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-364" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[35]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.HealthcareApis"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-365" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[36]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.IotHub"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-366" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[37]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.KeyVault"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-367" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[38]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.Kusto"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-368" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[39]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.LogicApp"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-369" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[40]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.MachineLearning"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-370" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[41]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.Maintenance"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-371" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[42]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.ManagedServiceIdentity"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-372" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[43]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.ManagedServices"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-373" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[44]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.MarketplaceOrdering"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-374" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[45]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.Media"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-375" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[46]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.Migrate"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-376" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[47]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.Monitor"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-377" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[48]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.MySql"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-378" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[49]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.Network"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-379" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[50]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.NotificationHubs"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-380" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[51]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.OperationalInsights"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-381" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[52]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.PolicyInsights"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-382" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[53]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.PostgreSql"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-383" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[54]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.PowerBIEmbedded"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-384" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[55]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.PrivateDns"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-385" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[56]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.RecoveryServices"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-386" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[57]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.RedisCache"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-387" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[58]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.RedisEnterpriseCache"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-388" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[59]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.Relay"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-389" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[60]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.ResourceMover"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-390" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[61]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.Resources"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-391" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[62]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.Security"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-392" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[63]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.SecurityInsights"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-393" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[64]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.ServiceBus"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-394" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[65]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.ServiceFabric"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-395" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[66]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.SignalR"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-396" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[67]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.Sql"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-397" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[68]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.SqlVirtualMachine"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-398" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[69]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.StackHCI"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-399" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[70]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.Storage"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-400" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[71]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.StorageSync"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-401" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[72]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.StreamAnalytics"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-402" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[73]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.Support"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-403" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[74]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.Synapse"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-404" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[75]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.TrafficManager"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-405" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[76]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Az.Websites"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-406" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[77]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Azure"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-407" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[78]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Azure.Storage"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-408" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[79]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["AzureRM.Automation"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-409" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[80]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["AzureRM.Compute"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-410" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[81]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["AzureRM.Profile"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-411" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[82]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["AzureRM.Resources"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-412" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[83]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["AzureRM.Sql"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-413" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[84]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["AzureRM.Storage"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-414" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[85]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["ComputerManagementDsc"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-415" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[86]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["GPRegistryPolicyParser"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-416" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[87]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Microsoft.PowerShell.Core"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-417" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[88]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Microsoft.PowerShell.Diagnostics"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-418" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[89]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Microsoft.PowerShell.Management"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-419" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[90]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Microsoft.PowerShell.Security"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-420" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[91]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Microsoft.PowerShell.Utility"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-421" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[92]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Microsoft.WSMan.Management"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-422" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[93]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["Orchestrator.AssetManagement.Cmdlets"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-423" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[94]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["PSDscResources"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-424" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[95]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["SecurityPolicyDsc"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-425" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[96]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["StateConfigCompositeResources"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-426" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[97]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["xDSCDomainjoin"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-427" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[98]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["xPowerShellExecutionPolicy"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_module" "res-428" {
  automation_account_name = var.automation_account_name
  name                    = var.automation_module_names[99]
  resource_group_name     = var.resource_group_name
  module_link {
    uri = var.automation_module_uris["xRemoteDesktopAdmin"]
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_schedule" "res-429" {
  automation_account_name = var.automation_account_name
  description             = var.automation_schedule_descriptions["autoshutdown_patch_start"]
  frequency               = var.automation_schedule_frequency_week
  name                    = var.automation_schedule_names["autoshutdown_patch_start"]
  resource_group_name     = var.resource_group_name
  timezone                = var.schedule_timezone_dublin
  week_days               = var.automation_schedule_patch_days
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_schedule" "res-430" {
  automation_account_name = var.automation_account_name
  description             = var.automation_schedule_descriptions["autoshutdown_patch_stop"]
  frequency               = var.automation_schedule_frequency_week
  name                    = var.automation_schedule_names["autoshutdown_patch_stop"]
  resource_group_name     = var.resource_group_name
  timezone                = var.schedule_timezone_dublin
  week_days               = var.automation_schedule_patch_days
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_schedule" "res-431" {
  automation_account_name = var.automation_account_name
  description             = var.automation_schedule_descriptions["autoshutdown_stop"]
  frequency               = var.automation_schedule_frequency_week
  name                    = var.automation_schedule_names["autoshutdown_stop"]
  resource_group_name     = var.resource_group_name
  timezone                = var.schedule_timezone_dublin
  week_days               = var.automation_schedule_office_days
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_schedule" "res-432" {
  automation_account_name = var.automation_account_name
  description             = var.automation_schedule_descriptions["eu_office_hours_patch_start"]
  frequency               = var.automation_schedule_frequency_week
  name                    = var.automation_schedule_names["eu_office_hours_patch_start"]
  resource_group_name     = var.resource_group_name
  timezone                = var.schedule_timezone_dublin
  week_days               = var.automation_schedule_patch_days
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_schedule" "res-433" {
  automation_account_name = var.automation_account_name
  description             = var.automation_schedule_descriptions["eu_office_hours_patch_stop"]
  frequency               = var.automation_schedule_frequency_week
  name                    = var.automation_schedule_names["eu_office_hours_patch_stop"]
  resource_group_name     = var.resource_group_name
  timezone                = var.schedule_timezone_dublin
  week_days               = var.automation_schedule_patch_days
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_schedule" "res-434" {
  automation_account_name = var.automation_account_name
  description             = var.automation_schedule_descriptions["eu_office_hours_start"]
  frequency               = var.automation_schedule_frequency_week
  name                    = var.automation_schedule_names["eu_office_hours_start"]
  resource_group_name     = var.resource_group_name
  timezone                = var.schedule_timezone_dublin
  week_days               = var.automation_schedule_office_days
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_schedule" "res-435" {
  automation_account_name = var.automation_account_name
  description             = var.automation_schedule_descriptions["eu_office_hours_stop"]
  frequency               = var.automation_schedule_frequency_week
  name                    = var.automation_schedule_names["eu_office_hours_stop"]
  resource_group_name     = var.resource_group_name
  timezone                = var.schedule_timezone_dublin
  week_days               = var.automation_schedule_office_days
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_schedule" "res-436" {
  automation_account_name = var.automation_account_name
  description             = var.automation_schedule_descriptions["ie_office_hours_patch_start"]
  frequency               = var.automation_schedule_frequency_week
  name                    = var.automation_schedule_names["ie_office_hours_patch_start"]
  resource_group_name     = var.resource_group_name
  timezone                = var.schedule_timezone_dublin
  week_days               = var.automation_schedule_patch_days
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_schedule" "res-437" {
  automation_account_name = var.automation_account_name
  description             = var.automation_schedule_descriptions["ie_office_hours_patch_stop"]
  frequency               = var.automation_schedule_frequency_week
  name                    = var.automation_schedule_names["ie_office_hours_patch_stop"]
  resource_group_name     = var.resource_group_name
  timezone                = var.schedule_timezone_dublin
  week_days               = var.automation_schedule_patch_days
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_schedule" "res-438" {
  automation_account_name = var.automation_account_name
  description             = var.automation_schedule_descriptions["ie_office_hours_start"]
  frequency               = var.automation_schedule_frequency_week
  name                    = var.automation_schedule_names["ie_office_hours_start"]
  resource_group_name     = var.resource_group_name
  timezone                = var.schedule_timezone_dublin
  week_days               = var.automation_schedule_office_days
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_schedule" "res-439" {
  automation_account_name = var.automation_account_name
  description             = var.automation_schedule_descriptions["ie_office_hours_stop"]
  frequency               = var.automation_schedule_frequency_week
  name                    = var.automation_schedule_names["ie_office_hours_stop"]
  resource_group_name     = var.resource_group_name
  timezone                = var.schedule_timezone_dublin
  week_days               = var.automation_schedule_office_days
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_schedule" "res-440" {
  automation_account_name = var.automation_account_name
  description             = var.automation_schedule_descriptions["india_office_hours_patch_start"]
  frequency               = var.automation_schedule_frequency_week
  name                    = var.automation_schedule_names["india_office_hours_patch_start"]
  resource_group_name     = var.resource_group_name
  timezone                = var.schedule_timezone_dublin
  week_days               = var.automation_schedule_patch_days
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_schedule" "res-441" {
  automation_account_name = var.automation_account_name
  description             = var.automation_schedule_descriptions["india_office_hours_patch_stop"]
  frequency               = var.automation_schedule_frequency_week
  name                    = var.automation_schedule_names["india_office_hours_patch_stop"]
  resource_group_name     = var.resource_group_name
  timezone                = var.schedule_timezone_dublin
  week_days               = var.automation_schedule_patch_days
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_schedule" "res-442" {
  automation_account_name = var.automation_account_name
  description             = var.automation_schedule_descriptions["india_office_hours_start"]
  frequency               = var.automation_schedule_frequency_week
  name                    = var.automation_schedule_names["india_office_hours_start"]
  resource_group_name     = var.resource_group_name
  timezone                = var.schedule_timezone_dublin
  week_days               = var.automation_schedule_office_days
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_schedule" "res-443" {
  automation_account_name = var.automation_account_name
  description             = var.automation_schedule_descriptions["india_office_hours_stop"]
  frequency               = var.automation_schedule_frequency_week
  name                    = var.automation_schedule_names["india_office_hours_stop"]
  resource_group_name     = var.resource_group_name
  timezone                = var.schedule_timezone_dublin
  week_days               = var.automation_schedule_office_days
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_schedule" "res-444" {
  automation_account_name = var.automation_account_name
  description             = var.automation_schedule_descriptions["workload_mw_patch_nightly_12am"]
  frequency               = var.automation_schedule_frequency_oneday
  name                    = var.automation_schedule_names["workload_mw_patch_nightly_12am"]
  resource_group_name     = var.resource_group_name
  timezone                = var.schedule_timezone_dublin
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_schedule" "res-445" {
  automation_account_name = var.automation_account_name
  description             = var.automation_schedule_descriptions["workload_mw_patch_nightly_12pm"]
  frequency               = var.automation_schedule_frequency_oneday
  name                    = var.automation_schedule_names["workload_mw_patch_nightly_12pm"]
  resource_group_name     = var.resource_group_name
  timezone                = var.schedule_timezone_dublin
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_schedule" "res-446" {
  automation_account_name = var.automation_account_name
  frequency               = var.automation_schedule_frequency_oneday
  name                    = var.automation_schedule_names["tag_policy_remediation_schedule"]
  resource_group_name     = var.resource_group_name
  timezone                = var.schedule_timezone_dublin
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_runbook" "res-447" {
  automation_account_name = var.automation_account_name
  content                 = "# To resolve the question of running a remediation task for a policy assignment\r\n\r\n# Step 1: Retrieve all policy assignments to identify the target for remediation\r\n\r\ntry\r\n{\r\n    \"Logging in to Azure...\"\r\n    Connect-AzAccount -Identity -AccountId \"a139e097-5a1c-4b9f-a6fd-347f260b3bff\"\r\n}\r\ncatch {\r\n    Write-Error -Message $_.Exception\r\n    throw $_.Exception\r\n}\r\n\r\n# Step 2: Start a remediation task for the specified policy assignment\r\n$policyAssignmentId = \"/providers/microsoft.management/managementgroups/${lower(var.automation_management_group)}/providers/microsoft.authorization/policyassignments/${var.automation_policy_asg}\" # Replace with actual subscription and policy assignment ID\r\n\r\nStart-AzPolicyRemediation -ManagementGroupName \"${var.automation_management_group}\" -PolicyAssignmentId $policyAssignmentId -Name \"remediationTask\" \r\n\r\nWrite-Output \"Remediation task successfully added\""
  location                = var.location
  log_progress            = false
  log_verbose             = false
  name                    = var.runbook_names["tag_policy_remediation"]
  resource_group_name     = var.resource_group_name
  runbook_type            = "PowerShell72"
  tags                    = local.tags_automation_runbook
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_runbook" "res-448" {
  automation_account_name = var.automation_account_name
  content                 = "$TagPairs = @(\r\n    @{ TagName = \"MaintWinPatch\"; TagValue = \"Nightly_patch\" }\r\n    @{ TagName = \"MaintWinPatch\"; TagValue = \"PilotGrp1\" }\r\n    @{ TagName = \"MaintWinPatch\"; TagValue = \"PilotGrp2\" }\r\n    @{ TagName = \"MaintWinPatch\"; TagValue = \"PilotGrp3\" }\r\n    @{ TagName = \"MaintWinPatch\"; TagValue = \"TestGrp1\" }\r\n    @{ TagName = \"MaintWinPatch\"; TagValue = \"TestGrp2\" }\r\n    @{ TagName = \"MaintWinPatch\"; TagValue = \"TestGrp3\" }\r\n    @{ TagName = \"MaintWinPatch\"; TagValue = \"PrepGrp1\" }\r\n    @{ TagName = \"MaintWinPatch\"; TagValue = \"PrepGrp2\" }\r\n    @{ TagName = \"MaintWinPatch\"; TagValue = \"PrepGrp3\" }\r\n    @{ TagName = \"MaintWinPatch\"; TagValue = \"ProdGrp1\" }\r\n    @{ TagName = \"MaintWinPatch\"; TagValue = \"ProdGrp2\" }\r\n    @{ TagName = \"MaintWinPatch\"; TagValue = \"ProdGrp3\" }\r\n    @{ TagName = \"MaintWinScan\"; TagValue = \"Nightly_scan\" }\r\n)\r\n \r\n \r\n #$TagName=\"maintainance\"\r\n #$TagValue=\"daily\"\r\n #$resourceGroup = \"DefaultResourceGroup-CCAN\"\r\n \r\n# Connect to Azure (if not already connected)\r\n# Authenticate with Managed Identity\r\nWrite-OutPut \"Starting Point\"\r\nDisable-AzContextAutosave -Scope Process\r\nConnect-AzAccount -Identity\r\nWrite-OutPut \"Authenticated\"\r\n \r\n# Parameters\r\n# $tagName = \"patch\"    # Specify your tag name\r\n# $tagValue = \"patch-001\"     # Specify your tag value\r\n#$maxConcurrentJobs = 10    # Maximum number of concurrent jobs\r\n \r\n# Function to process VMs in a subscription\r\nfunction Process-VMs {\r\nparam (\r\n    [string]$SubscriptionId,\r\n    [string]$SubscriptionName\r\n)\r\n  az account set --subscription $SubscriptionId\r\n \r\n Set-AzContext -SubscriptionId $SubscriptionId\r\n \r\nWrite-OutPut \"`nProcessing Subscription: $SubscriptionName ($SubscriptionId)\"\r\n \r\n# Get all VMs with the specified tag\r\n \r\n$vms = Get-AzVM | Where-Object {\r\n    $vm = $_\r\n    $TagPairs | Where-Object {\r\n        $vm.Tags.Keys -contains $_.TagName -and $vm.Tags[$_.TagName] -eq $_.TagValue\r\n    }\r\n}\r\nif ($vms.Count -eq 0) {\r\n    Write-OutPut \"No VMs found with tag $tagName = $tagValue in subscription $SubscriptionName\"\r\n    return\r\n}\r\n \r\n# Get all existing maintenance configurations in the RG\r\n#$maintenanceConfigs = Get-AzMaintenanceConfiguration -ResourceGroupName \"DefaultResourceGroup-CCAN\"\r\n \r\n \r\n foreach ($vm in $vms) {\r\n   Write-Host \"`nProcessing VM: $($vm.Name)\"\r\n \r\n    # Check OS Type\r\n    if ($vm.StorageProfile.OSDisk.OSType -eq \"Windows\") {\r\n        Write-Host \"Detected Windows VM\"\r\n \r\n        # Set patch mode\r\n        Set-AzVMOperatingSystem -VM $vm -Windows -PatchMode \"AutomaticByPlatform\" | Out-Null\r\n \r\n        # Ensure patch settings exist\r\n        if (-not $vm.OSProfile.WindowsConfiguration.PatchSettings) {\r\n            $vm.OSProfile.WindowsConfiguration.PatchSettings = New-Object -TypeName Microsoft.Azure.Management.Compute.Models.WindowsVMGuestPatchSettings\r\n        }\r\n \r\n        # Check and apply AutomaticByPlatformSettings\r\n        $autoSettings = $vm.OSProfile.WindowsConfiguration.PatchSettings.AutomaticByPlatformSettings\r\n        if (-not $autoSettings) {\r\n            $vm.OSProfile.WindowsConfiguration.PatchSettings.AutomaticByPlatformSettings = New-Object -TypeName Microsoft.Azure.Management.Compute.Models.WindowsVMGuestPatchAutomaticByPlatformSettings -Property @{\r\n                BypassPlatformSafetyChecksOnUserSchedule = $true\r\n            }\r\n        } else {\r\n            $autoSettings.BypassPlatformSafetyChecksOnUserSchedule = $true\r\n        }\r\n         Write-Host \"Updating VM: $($vm.Name)\"\r\n    Update-AzVM -VM $vm -ResourceGroupName $vm.ResourceGroupName\r\n    }\r\n    elseif ($vm.StorageProfile.OSDisk.OSType -eq \"Linux\") {\r\n        Write-Host \"Detected Linux VM\"\r\n \r\n        # Set patch mode\r\n        Set-AzVMOperatingSystem -VM $vm -Linux -PatchMode \"AutomaticByPlatform\" | Out-Null\r\n \r\n        # Ensure patch settings exist\r\n        if (-not $vm.OSProfile.LinuxConfiguration.PatchSettings) {\r\n            $vm.OSProfile.LinuxConfiguration.PatchSettings = New-Object -TypeName Microsoft.Azure.Management.Compute.Models.LinuxVMGuestPatchSettings\r\n        }\r\n \r\n        # Check and apply AutomaticByPlatformSettings\r\n        $autoSettings = $vm.OSProfile.LinuxConfiguration.PatchSettings.AutomaticByPlatformSettings\r\n        if (-not $autoSettings) {\r\n            $vm.OSProfile.LinuxConfiguration.PatchSettings.AutomaticByPlatformSettings = New-Object -TypeName Microsoft.Azure.Management.Compute.Models.LinuxVMGuestPatchAutomaticByPlatformSettings -Property @{\r\n                BypassPlatformSafetyChecksOnUserSchedule = $true\r\n            }\r\n        } else {\r\n            $autoSettings.BypassPlatformSafetyChecksOnUserSchedule = $true\r\n        }\r\n         Write-Host \"Updating VM: $($vm.Name)\"\r\n    Update-AzVM -VM $vm -ResourceGroupName $vm.ResourceGroupName\r\n    }\r\n     else {\r\n        Write-Warning \"Unknown OS type for VM: $($vm.Name). Skipping.\"\r\n        continue\r\n    }\r\n \r\n    # Apply the change\r\n   \r\n$vmName = $vm.Name\r\n  $rgName = $vm.ResourceGroupName\r\n    # Get the value of the tag for the input tag name\r\n$tagKey = $TagPairs | Where-Object { $vm.Tags.ContainsKey($_.TagName) } | Select-Object -First 1 -ExpandProperty TagName\r\n$tagValue = $null\r\nif ($tagKey) {\r\n    $tagValue = $vm.Tags[$tagKey]\r\n}\r\n    Write-OutPut \" VM '$vmName' has tag $tagKey = '$tagValue'\"\r\n    # Step 1: Get the access token\r\n    $configId = Get-MaintenanceConfigIdByName -ConfigName $tagValue\r\n#$accessToken = (az account get-access-token --query accessToken -o tsv)\r\n$accessToken = (Get-AzAccessToken -ResourceUrl \"https://management.azure.com/\").Token\r\n# Step 2: Set the URL and request body\r\n$url = \"https://management.azure.com/subscriptions/$SubscriptionId/resourceGroups/$rgName/providers/Microsoft.Compute/virtualMachines/$vmName/providers/Microsoft.Maintenance/configurationAssignments/$vmName\"+\"?api-version=2021-09-01-preview\"\r\n \r\n \r\n$body = @{\r\n    location = \"eastus\"\r\n    properties = @{\r\n        maintenanceConfigurationId = $configId\r\n    }\r\n} | ConvertTo-Json -Depth 5\r\n \r\n# Step 3: Set headers\r\n$headers = @{\r\n    Authorization = \"Bearer $accessToken\"\r\n    \"Content-Type\" = \"application/json\"\r\n}\r\n \r\n# Step 4: Make the PUT request\r\n \r\ntry {\r\n    $response = Invoke-RestMethod -Method PUT -Uri $url -Headers $headers -Body $body\r\n    Write-OutPut \"Success!\"\r\n    $response\r\n} catch {\r\n    Write-OutPut \"Request failed:\"\r\n   \r\n    $respStream = $_.Exception.Response.GetResponseStream()\r\n    $reader = New-Object System.IO.StreamReader($respStream)\r\n    $reader.BaseStream.Position = 0\r\n    $reader.DiscardBufferedData()\r\n    $responseBody = $reader.ReadToEnd()\r\n   \r\n    try {\r\n        $json = $responseBody | ConvertFrom-Json\r\n        $json | Format-List\r\n    } catch {\r\n        Write-OutPut \"Raw response:\"\r\n        Write-Output $responseBody\r\n    }\r\n}\r\n \r\n \r\n}\r\n}\r\n \r\n function Get-MaintenanceConfigIdByName {\r\n    param(\r\n        [Parameter(Mandatory = $true)]\r\n        [string]$ConfigName\r\n    )\r\n \r\n    # Ensure logged in\r\n    if (-not (Get-AzContext)) {\r\n        Connect-AzAccount | Out-Null\r\n    }\r\n \r\n    $apiVersion = \"2023-04-01\"\r\n    $subscriptions = Get-AzSubscription\r\n    foreach ($sub in $subscriptions) {\r\n        # Set subscription context\r\n        Set-AzContext -SubscriptionId $sub.Id | Out-Null\r\n \r\n        # Build API URI\r\n        $uri = \"https://management.azure.com/subscriptions/$($sub.Id)/providers/Microsoft.Maintenance/maintenanceConfigurations?api-version=$apiVersion\"\r\n \r\n        # Get access token\r\n        $accessToken = (Get-AzAccessToken).Token\r\n \r\n        $headers = @{\r\n            'Authorization' = \"Bearer $accessToken\"\r\n            'Content-Type'  = 'application/json'\r\n        }\r\n \r\n        try {\r\n            $response = Invoke-RestMethod -Uri $uri -Method Get -Headers $headers\r\n            $configs = $response.value\r\n \r\n            # Filter by name\r\n            $match = $configs | Where-Object { $_.name -eq $ConfigName } | Select-Object -First 1\r\n \r\n            if ($match) {\r\n                return $match.id\r\n            }\r\n        }\r\n        catch {\r\n            Write-Warning \"Failed to query subscription $($sub.Id): $_\"\r\n        }\r\n    }\r\n \r\n    # If nothing found, return null\r\n    return $null\r\n}\r\n \r\n# Main script\r\ntry {\r\nWrite-OutPut \"Getting Subscriptions\"\r\n$subscriptions = Get-AzSubscription\r\n Write-OutPut $subscriptions\r\n \r\nforeach ($sub in $subscriptions) {\r\n    Set-AzContext -SubscriptionId $sub.Id | Out-Null\r\n    Write-OutPut $Sub.id\r\n    Process-VMs -SubscriptionId $sub.Id -SubscriptionName $sub.Name\r\n}\r\n #Process-VMs -SubscriptionId $sub.Id -SubscriptionName \"CSSP_AZR_MANAGEMENT\"\r\n}\r\ncatch {\r\nWrite-OutPut \"Error: $_\" -ForegroundColor Red\r\n}\r\nfinally {\r\nGet-Job | Remove-Job -Force\r\nWrite-OutPut \"`nScript execution completed\"\r\n}\r\n\r\n <#\r\nparam (\r\n     \r\n    [Parameter(Mandatory = $true)]\r\n    [string]$TagName=\"maintainance\",\r\n \r\n    [Parameter(Mandatory = $true)]\r\n    [string]$TagValue=\"daily\"\r\n)#>\r\n \r\n $TagName=\"maintainance\"\r\n $TagValue=\"daily\"\r\n $resourceGroup = \"DefaultResourceGroup-CCAN\"\r\n\r\n# Connect to Azure (if not already connected)\r\n# Authenticate with Managed Identity\r\naz login\r\n\r\n# Parameters\r\n# $tagName = \"patch\"    # Specify your tag name\r\n# $tagValue = \"patch-001\"     # Specify your tag value\r\n$maxConcurrentJobs = 10    # Maximum number of concurrent jobs\r\n \r\n# Function to process VMs in a subscription\r\nfunction Process-VMs {\r\nparam (\r\n    [string]$SubscriptionId,\r\n    [string]$SubscriptionName\r\n)\r\n  az account set --subscription $SubscriptionId\r\n\r\n Set-AzContext -SubscriptionId $SubscriptionId\r\n \r\n Get-AzContext\r\nWrite-Host \"`nProcessing Subscription: $SubscriptionName ($SubscriptionId)\" -ForegroundColor Yellow\r\n \r\n# Get all VMs with the specified tag\r\n$vms = Get-AzVM | Where-Object {$_.Tags.Keys -contains $tagName -and $_.Tags[$tagName] -eq $tagValue}\r\n \r\nif ($vms.Count -eq 0) {\r\n    Write-Host \"No VMs found with tag $tagName = $tagValue in subscription $SubscriptionName\" -ForegroundColor Yellow\r\n    return\r\n}\r\n\r\n# Get all existing maintenance configurations in the RG\r\n$maintenanceConfigs = Get-AzMaintenanceConfiguration #-ResourceGroupName $resourceGroup\r\n\r\n foreach ($vm in $vms) {\r\n$vmName = $vm.Name\r\n    $tagValue = $vm.Tags[$tagName]\r\n    \r\n    Write-Host \" VM '$vmName' has tag $tagKey = '$tagValue'\"\r\n    \r\n    # Find matching maintenance configuration by name\r\n    $config = $maintenanceConfigs | Where-Object { $_.Name -eq $tagValue }\r\n    \r\n    if (-not $config) {\r\n        Write-Warning \" No maintenance configuration found with name '$tagValue'. Skipping VM '$vmName'\"\r\n        continue\r\n    }\r\n  \r\n    # Assign VM to maintenance configuration\r\n    $assignmentName = \"$vmName-$tagValue\"\r\n\r\n    Write-Host \" Assigning VM '$vmName' to maintenance config '$tagValue'\"\r\n   az maintenance assignment create   --resource-group $vm.ResourceGroupName   --location $vm.Location  --resource-name $vm.Name   --resource-type virtualMachines   --provider-name Microsoft.Compute   --configuration-assignment-name $($vm.Name)-$($config.Name)   --maintenance-configuration-id $config.Id \r\n}\r\n}\r\n \r\n# Main script\r\ntry {\r\n$subscriptions = Get-AzSubscription\r\n \r\nforeach ($sub in $subscriptions) {\r\n    Set-AzContext -SubscriptionId $sub.Id | Out-Null\r\n    Process-VMs -SubscriptionId $sub.Id -SubscriptionName $sub.Name\r\n}\r\n}\r\ncatch {\r\nWrite-Host \"Error: $_\" -ForegroundColor Red\r\n}\r\nfinally {\r\nGet-Job | Remove-Job -Force\r\nWrite-Host \"`nScript execution completed\" -ForegroundColor Green\r\n}\r\n "
  description             = "This is a runbook to start/stop VMs based on tags"
  location                = var.location
  log_progress            = true
  log_verbose             = true
  name                    = var.runbook_names["aum_attach_vm"]
  resource_group_name     = var.resource_group_name
  runbook_type            = var.runbook_type
  tags                    = local.tags_automation_runbook
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_automation_runbook" "res-449" {
  automation_account_name = var.automation_account_name
  content                 = "\r\nparam (\r\n    [Parameter(Mandatory = $true)]\r\n    [ValidateSet(\"Start\", \"Stop\")]\r\n    [string]$Action,\r\n\r\n    [Parameter(Mandatory = $true)]\r\n    [string]$TagName,\r\n\r\n    [Parameter(Mandatory = $true)]\r\n    [string]$TagValue\r\n)\r\n\r\n$allowedenv= @(\"DEV\", \"NPRD\", \"PP\", \"UAT\", \"SIT\", \"ST\", \"SANDBOX\")\r\n\r\n# Connect to Azure (if not already connected)\r\n# Authenticate with Managed Identity\r\nDisable-AzContextAutosave -Scope Process\r\nConnect-AzAccount -Identity\r\n\r\n# Parameters\r\n# $tagName = \"patch\"    # Specify your tag name\r\n# $tagValue = \"patch-001\"     # Specify your tag value\r\n$maxConcurrentJobs = 10    # Maximum number of concurrent jobs\r\n\r\n# Function to process VMs in a subscription\r\nfunction Process-VMs {\r\nparam (\r\n    [string]$SubscriptionId,\r\n    [string]$SubscriptionName\r\n)\r\n\r\nWrite-Host \"`nProcessing Subscription: $SubscriptionName ($SubscriptionId)\" -ForegroundColor Yellow\r\n\r\n# Get all VMs with the specified tag\r\n$vms = Get-AzVM | Where-Object {$_.Tags.Keys -contains $tagName -and $_.Tags[$tagName] -eq $tagValue}\r\n\r\nif ($vms.Count -eq 0) {\r\n    Write-Host \"No VMs found with tag $tagName = $tagValue in subscription $SubscriptionName\" -ForegroundColor Yellow\r\n    return\r\n}\r\n\r\n$jobs = @()\r\n\r\nforeach ($vm in $vms) {\r\n    # Wait if we've reached the maximum number of concurrent jobs\r\n    $envtag= $vm.Tags[\"Environment\"]\r\n    if($allowedenv  -contains $envtag)\r\n    {\r\n    while ((Get-Job -State Running).Count -ge $maxConcurrentJobs) {\r\n        Start-Sleep -Seconds 1\r\n        $completedJobs = Get-Job -State Completed\r\n        foreach ($job in $completedJobs) {\r\n            Receive-Job -Job $job\r\n            Remove-Job -Job $job\r\n        }\r\n    }\r\n    \r\n    # Start a new job for this VM\r\n    $jobs += Start-Job -ScriptBlock {\r\n        param($VM, $SubscriptionId)\r\n        Import-Module Az.Accounts\r\n        Import-Module Az.Compute\r\n        Disable-AzContextAutosave -Scope Process\r\n        Connect-AzAccount -Identity\r\n        # Set subscription context\r\n        Set-AzContext -SubscriptionId $SubscriptionId | Out-Null\r\n\r\n        Get the current status of the VM\r\n        $status = (Get-AzVM -ResourceGroupName $VM.ResourceGroupName -Name $VM.Name -Status).Statuses | \r\n                  Where-Object { $_.Code -match \"PowerState\" }\r\n        $powerState = $status.DisplayStatus\r\n        Write-Output \"VM: $($VM.Name) - Current Power State: $powerState\"\r\n\r\n        try {\r\n           if ($powerState -eq \"VM running\") {\r\n                Write-Output \"Stopping VM: $($VM.Name)\"\r\n                Stop-AzVM -ResourceGroupName $VM.ResourceGroupName -Name $VM.Name -Force\r\n                Write-Output \"VM $($VM.Name) stopped successfully\"\r\n            }\r\n             elseif ($powerState -eq \"VM deallocated\") {\r\n                Write-Output \"Starting VM: $($VM.Name)\"\r\n                Start-AzVM -ResourceGroupName $VM.ResourceGroupName -Name $VM.Name\r\n                Write-Output \"VM $($VM.Name) started successfully\"\r\n            }\r\n            else {\r\n                Write-Output \"VM $($VM.Name) is in transition state ($powerState). Skipping...\"\r\n            }\r\n        }\r\n        catch {\r\n            Write-Output \"Error processing VM $($VM.Name): $_\"\r\n        }\r\n    } -ArgumentList $vm, $SubscriptionId\r\n}\r\n}\r\n# Wait for remaining jobs to complete and process their output\r\nWrite-Host \"Waiting for remaining jobs to complete...\" -ForegroundColor Yellow\r\nWait-Job -Job $jobs | Out-Null\r\n\r\nforeach ($job in $jobs) {\r\n    Receive-Job -Job $job\r\n    Remove-Job -Job $job\r\n}\r\n}\r\n\r\n# Main script\r\ntry {\r\n$subscriptions = Get-AzSubscription\r\n\r\nforeach ($sub in $subscriptions) {\r\n    Set-AzContext -SubscriptionId $sub.Id | Out-Null\r\n    Process-VMs -SubscriptionId $sub.Id -SubscriptionName $sub.Name\r\n}\r\n}\r\ncatch {\r\nWrite-Host \"Error: $_\" -ForegroundColor Red\r\n}\r\nfinally {\r\nGet-Job | Remove-Job -Force\r\nWrite-Host \"`nScript execution completed\" -ForegroundColor Green\r\n}"
  description             = "This is a runbook to start/stop VMs based on tags"
  location                = var.location
  log_progress            = true
  log_verbose             = true
  name                    = var.runbook_names["vm_start_stop"]
  resource_group_name     = var.resource_group_name
  runbook_type            = var.runbook_type
  tags                    = local.tags_automation_runbook
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_managed_disk" "res-450" {
  create_option          = "FromImage"
  disk_encryption_set_id = "/subscriptions/${var.subscription_id}/resourceGroups/${var.disk_encryption_set_resource_group}/providers/Microsoft.Compute/diskEncryptionSets/${var.disk_encryption_set_name}"
  hyper_v_generation     = "V1"
  image_reference_id     = "/Subscriptions/${var.subscription_id}/Providers/Microsoft.Compute/Locations/${var.location}/Publishers/${var.vm_image_publisher}/ArtifactTypes/VMImage/Offers/${var.vm_image_offer}/Skus/${var.vm_image_sku}/Versions/${var.vm_image_version}"
  location               = var.location
  name                   = "M-CSSPZ-OVOC-IMAGE_OsDisk_1_23e74f38e4c04fccaa56f89b7780dd34"
  os_type                = "Linux"
  resource_group_name    = var.resource_group_name
  storage_account_type   = var.managed_disk_storage_account_type
  tags                   = local.tags_managed_disk
  zone                   = "1"
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_windows_virtual_machine" "res-451" {
  admin_password        = var.vm_cyberark_admin_password
  admin_username        = var.vm_cyberark_admin_username
  location              = var.location
  name                  = "M-CSSPZ-VM-CYBERARK-MAN-PRD-001"
  network_interface_ids = ["/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.Network/networkInterfaces/m-csspz-vm-cyberark-man-prd-001315_z1"]
  resource_group_name   = var.resource_group_name
  secure_boot_enabled   = var.vm_cyberark_secure_boot_enabled
  size                  = var.vm_cyberark_size
  tags                  = local.tags_virtual_machine
  vtpm_enabled          = var.vm_cyberark_vtpm_enabled
  zone                  = var.vm_cyberark_availability_zone
  additional_capabilities {
  }
  boot_diagnostics {
  }
  identity {
    type = "SystemAssigned"
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.managed_disk_storage_account_type
  }
  source_image_reference {
    offer     = var.vm_image_offer
    publisher = var.vm_image_publisher
    sku       = var.vm_image_sku
    version   = var.vm_image_version
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
    userName = var.vm_cyberark_admin_username
  })
  tags                 = local.tags_vm_extension
  type                 = "VMAccessAgent"
  type_handler_version = var.vm_extension_vmaccess_handler_version
  virtual_machine_id   = "/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.Compute/virtualMachines/M-CSSPZ-VM-CYBERARK-MAN-PRD-001"
  depends_on = [
    azurerm_windows_virtual_machine.res-451,
  ]
}
resource "azurerm_monitor_metric_alert" "res-453" {
  description         = "Metric Alert for Automation Account TotalJob Alert"
  name                = "${var.automation_account_name}-TotalJob"
  resource_group_name = var.resource_group_name
  scopes              = ["/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.Automation/automationAccounts/${var.automation_account_name}"]
  severity            = var.metric_alert_severity_level
  tags                = local.tags_alert
  criteria {
    aggregation      = var.metric_alert_aggregation
    metric_name      = var.metric_alert_metric_names["total_job"]
    metric_namespace = var.metric_alert_metric_namespace
    operator         = var.metric_alert_operator
    threshold        = var.metric_alert_threshold_total_job
    dynamic "dimension" {
      for_each = var.metric_alert_dimension_exclusions
      content {
        name     = title(dimension.key)
        operator = dimension.value.operator
        values   = dimension.value.values
      }
    }
  }
  depends_on = [
    azurerm_automation_account.res-31,
  ]
}
resource "azurerm_maintenance_configuration" "res-454" {
  in_guest_user_patch_mode = var.maintenance_config_user_patch_mode
  location                 = var.location
  name                     = "Nightly-2am"
  resource_group_name      = var.resource_group_name
  scope                    = "InGuestPatch"
  tags                     = local.tags_maintenance_config
  install_patches {
    reboot = var.maintenance_window_reboot_policy
    linux {
      classifications_to_include = var.maintenance_config_linux_classifications
    }
    windows {
      classifications_to_include = var.maintenance_config_windows_classifications
    }
  }
  window {
    duration        = var.maintenance_window_time_duration
    recur_every     = var.maintenance_recurrence_patterns["daily"]
    start_date_time = var.maintenance_window_start_dates["nightly_2am"]
    time_zone       = var.schedule_timezone_gmt
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_maintenance_configuration" "res-455" {
  in_guest_user_patch_mode = var.maintenance_config_user_patch_mode
  location                 = var.location
  name                     = var.maintenance_configuration_names["nightly_3am"]
  resource_group_name      = var.resource_group_name
  scope                    = var.maintenance_configuration_scope
  tags                     = local.tags_maintenance_config
  install_patches {
    reboot = var.maintenance_window_reboot_policy
    linux {
      classifications_to_include = var.maintenance_config_linux_classifications
    }
    windows {
      classifications_to_include = var.maintenance_config_windows_classifications
    }
  }
  window {
    duration        = var.maintenance_window_time_duration
    recur_every     = var.maintenance_recurrence_patterns["daily"]
    start_date_time = var.maintenance_window_start_dates["nightly_3am"]
    time_zone       = var.schedule_timezone_gmt
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_maintenance_configuration" "res-456" {
  in_guest_user_patch_mode = var.maintenance_config_user_patch_mode
  location                 = var.location
  name                     = var.maintenance_configuration_names["pilot_grp1"]
  resource_group_name      = var.resource_group_name
  scope                    = var.maintenance_configuration_scope
  tags                     = local.tags_maintenance_config
  install_patches {
    reboot = var.maintenance_window_reboot_policy
    linux {
      classifications_to_include = var.maintenance_config_linux_classifications
    }
    windows {
      classifications_to_include = var.maintenance_config_windows_classifications
    }
  }
  window {
    duration        = var.maintenance_window_time_duration
    recur_every     = var.maintenance_recurrence_patterns["first_tuesday"]
    start_date_time = var.maintenance_window_start_dates["pilot_grp1"]
    time_zone       = var.schedule_timezone_gmt
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_maintenance_configuration" "res-457" {
  in_guest_user_patch_mode = var.maintenance_config_user_patch_mode
  location                 = var.location
  name                     = var.maintenance_configuration_names["pilot_grp2"]
  resource_group_name      = var.resource_group_name
  scope                    = var.maintenance_configuration_scope
  tags                     = local.tags_maintenance_config
  install_patches {
    reboot = var.maintenance_window_reboot_policy
    linux {
      classifications_to_include = var.maintenance_config_linux_classifications
    }
    windows {
      classifications_to_include = var.maintenance_config_windows_classifications
    }
  }
  window {
    duration        = var.maintenance_window_time_duration
    recur_every     = var.maintenance_recurrence_patterns["first_tuesday"]
    start_date_time = var.maintenance_window_start_dates["pilot_grp2"]
    time_zone       = var.schedule_timezone_gmt
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_maintenance_configuration" "res-458" {
  in_guest_user_patch_mode = var.maintenance_config_user_patch_mode
  location                 = var.location
  name                     = var.maintenance_configuration_names["pilot_grp3"]
  resource_group_name      = var.resource_group_name
  scope                    = var.maintenance_configuration_scope
  tags                     = local.tags_maintenance_config
  install_patches {
    reboot = var.maintenance_window_reboot_policy
    linux {
      classifications_to_include = var.maintenance_config_linux_classifications
    }
    windows {
      classifications_to_include = var.maintenance_config_windows_classifications
    }
  }
  window {
    duration        = var.maintenance_window_time_duration
    recur_every     = var.maintenance_recurrence_patterns["first_tuesday"]
    start_date_time = var.maintenance_window_start_dates["pilot_grp3"]
    time_zone       = var.schedule_timezone_gmt
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_maintenance_configuration" "res-459" {
  in_guest_user_patch_mode = var.maintenance_config_user_patch_mode
  location                 = var.location
  name                     = var.maintenance_configuration_names["prep_grp1"]
  resource_group_name      = var.resource_group_name
  scope                    = var.maintenance_configuration_scope
  tags                     = local.tags_maintenance_config
  install_patches {
    reboot = var.maintenance_window_reboot_policy
    linux {
      classifications_to_include = var.maintenance_config_linux_classifications
    }
    windows {
      classifications_to_include = var.maintenance_config_windows_classifications
    }
  }
  window {
    duration        = var.maintenance_window_time_duration
    recur_every     = var.maintenance_recurrence_patterns["third_tuesday"]
    start_date_time = var.maintenance_window_start_dates["prep_grp1"]
    time_zone       = var.schedule_timezone_gmt
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_maintenance_configuration" "res-460" {
  in_guest_user_patch_mode = var.maintenance_config_user_patch_mode
  location                 = var.location
  name                     = var.maintenance_configuration_names["prep_grp2"]
  resource_group_name      = var.resource_group_name
  scope                    = var.maintenance_configuration_scope
  tags                     = local.tags_maintenance_config
  install_patches {
    reboot = var.maintenance_window_reboot_policy
    linux {
      classifications_to_include = var.maintenance_config_linux_classifications
    }
    windows {
      classifications_to_include = var.maintenance_config_windows_classifications
    }
  }
  window {
    duration        = var.maintenance_window_time_duration
    recur_every     = var.maintenance_recurrence_patterns["third_wednesday"]
    start_date_time = var.maintenance_window_start_dates["prep_grp2"]
    time_zone       = var.schedule_timezone_gmt
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_maintenance_configuration" "res-461" {
  in_guest_user_patch_mode = var.maintenance_config_user_patch_mode
  location                 = var.location
  name                     = var.maintenance_configuration_names["prep_grp3"]
  resource_group_name      = var.resource_group_name
  scope                    = var.maintenance_configuration_scope
  tags                     = local.tags_maintenance_config
  install_patches {
    reboot = var.maintenance_window_reboot_policy
    linux {
      classifications_to_include = var.maintenance_config_linux_classifications
    }
    windows {
      classifications_to_include = var.maintenance_config_windows_classifications
    }
  }
  window {
    duration        = var.maintenance_window_time_duration
    recur_every     = var.maintenance_recurrence_patterns["third_thursday"]
    start_date_time = var.maintenance_window_start_dates["prep_grp3"]
    time_zone       = var.schedule_timezone_gmt
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_maintenance_configuration" "res-462" {
  in_guest_user_patch_mode = var.maintenance_config_user_patch_mode
  location                 = var.location
  name                     = var.maintenance_configuration_names["prod_grp1"]
  resource_group_name      = var.resource_group_name
  scope                    = var.maintenance_configuration_scope
  tags                     = local.tags_maintenance_config
  install_patches {
    reboot = var.maintenance_window_reboot_policy
    linux {
      classifications_to_include = var.maintenance_config_linux_classifications
    }
    windows {
      classifications_to_include = var.maintenance_config_windows_classifications
    }
  }
  window {
    duration        = var.maintenance_window_time_duration
    recur_every     = var.maintenance_recurrence_patterns["fourth_tuesday"]
    start_date_time = var.maintenance_window_start_dates["prod_grp1"]
    time_zone       = var.schedule_timezone_gmt
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_maintenance_configuration" "res-463" {
  in_guest_user_patch_mode = var.maintenance_config_user_patch_mode
  location                 = var.location
  name                     = var.maintenance_configuration_names["prod_grp2"]
  resource_group_name      = var.resource_group_name
  scope                    = var.maintenance_configuration_scope
  tags                     = local.tags_maintenance_config
  install_patches {
    reboot = var.maintenance_window_reboot_policy
    linux {
      classifications_to_include = var.maintenance_config_linux_classifications
    }
    windows {
      classifications_to_include = var.maintenance_config_windows_classifications
    }
  }
  window {
    duration        = var.maintenance_window_time_duration
    recur_every     = var.maintenance_recurrence_patterns["fourth_wednesday"]
    start_date_time = var.maintenance_window_start_dates["prod_grp2"]
    time_zone       = var.schedule_timezone_gmt
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_maintenance_configuration" "res-464" {
  in_guest_user_patch_mode = var.maintenance_config_user_patch_mode
  location                 = var.location
  name                     = var.maintenance_configuration_names["prod_grp3"]
  resource_group_name      = var.resource_group_name
  scope                    = var.maintenance_configuration_scope
  tags                     = local.tags_maintenance_config
  install_patches {
    reboot = var.maintenance_window_reboot_policy
    linux {
      classifications_to_include = var.maintenance_config_linux_classifications
    }
    windows {
      classifications_to_include = var.maintenance_config_windows_classifications
    }
  }
  window {
    duration        = var.maintenance_window_time_duration
    recur_every     = var.maintenance_recurrence_patterns["fourth_thursday"]
    start_date_time = var.maintenance_window_start_dates["prod_grp3"]
    time_zone       = var.schedule_timezone_gmt
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_maintenance_configuration" "res-465" {
  in_guest_user_patch_mode = var.maintenance_config_user_patch_mode
  location                 = var.location
  name                     = var.maintenance_configuration_names["test_grp1"]
  resource_group_name      = var.resource_group_name
  scope                    = var.maintenance_configuration_scope
  tags                     = local.tags_maintenance_config
  install_patches {
    reboot = var.maintenance_window_reboot_policy
    linux {
      classifications_to_include = var.maintenance_config_linux_classifications
    }
    windows {
      classifications_to_include = var.maintenance_config_windows_classifications
    }
  }
  window {
    duration        = var.maintenance_window_time_duration
    recur_every     = var.maintenance_recurrence_patterns["second_tuesday"]
    start_date_time = var.maintenance_window_start_dates["test_grp1"]
    time_zone       = var.schedule_timezone_gmt
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_maintenance_configuration" "res-466" {
  in_guest_user_patch_mode = var.maintenance_config_user_patch_mode
  location                 = var.location
  name                     = var.maintenance_configuration_names["test_grp2"]
  resource_group_name      = var.resource_group_name
  scope                    = var.maintenance_configuration_scope
  tags                     = local.tags_maintenance_config
  install_patches {
    reboot = var.maintenance_window_reboot_policy
    linux {
      classifications_to_include = var.maintenance_config_linux_classifications
    }
    windows {
      classifications_to_include = var.maintenance_config_windows_classifications
    }
  }
  window {
    duration        = var.maintenance_window_time_duration
    recur_every     = var.maintenance_recurrence_patterns["second_tuesday"]
    start_date_time = var.maintenance_window_start_dates["test_grp2"]
    time_zone       = var.schedule_timezone_gmt
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_maintenance_configuration" "res-467" {
  in_guest_user_patch_mode = var.maintenance_config_user_patch_mode
  location                 = var.location
  name                     = var.maintenance_configuration_names["test_grp3"]
  resource_group_name      = var.resource_group_name
  scope                    = var.maintenance_configuration_scope
  tags                     = local.tags_maintenance_config
  install_patches {
    reboot = var.maintenance_window_reboot_policy
    linux {
      classifications_to_include = var.maintenance_config_linux_classifications
    }
    windows {
      classifications_to_include = var.maintenance_config_windows_classifications
    }
  }
  window {
    duration        = var.maintenance_window_time_duration
    recur_every     = var.maintenance_recurrence_patterns["second_tuesday"]
    start_date_time = var.maintenance_window_start_dates["test_grp3"]
    time_zone       = var.schedule_timezone_gmt
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_virtual_machine_extension" "res-468" {
  auto_upgrade_minor_version = true
  name                       = var.vm_extension_azmonitor_name
  publisher                  = "Microsoft.Azure.Monitor"
  tags                       = local.tags_vm_extension
  type                       = var.vm_extension_azmonitor_name
  type_handler_version       = var.vm_extension_azmonitor_handler_version
  virtual_machine_id         = "/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.Compute/virtualMachines/M-CSSPZ-VM-CYBERARK-MAN-PRD-001"
  depends_on = [
    azurerm_windows_virtual_machine.res-451,
  ]
}
