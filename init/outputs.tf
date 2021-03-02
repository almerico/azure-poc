output "tf_state_resource_group_name" {
  value = data.azurerm_storage_account.account.resource_group_name
}

output "tf_state_storage_account_name" {
  value = data.azurerm_storage_account.account.name
}

output "tf_state_storage_container_name" {
  value = azurerm_storage_container.core-container.name
}

output "tf_state_storage_account" {
  value = data.azurerm_storage_account.account
}


