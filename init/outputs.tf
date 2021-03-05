output "storage_account_resource_group" {
  value = local.storage_account_rg
}

output "storage_account_name" {
  value = local.storage_account
}

output "storage_container_core_name" {
  value = azurerm_storage_container.core-container.name
}
