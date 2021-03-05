output "storage_account_name" {
  value = join("", azurerm_storage_account.storage_account.*.name)
}

output "storage_account_resource_group" {
  value = var.resoure_group
}
