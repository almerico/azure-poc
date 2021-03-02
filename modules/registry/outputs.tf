output "registry_id" {
  value = join("", azurerm_container_registry.acr.*.id)
}
output "registry_login_server" {
  value = join("", azurerm_container_registry.acr.*.login_server) 
}

output "registry_admin_enabled" {
  value = join("", azurerm_container_registry.acr.*.admin_enabled)
}

output "registry_admin_username" {
  value = join("", azurerm_container_registry.acr.*.admin_username)
}

output "registry_admin_password" {
  value = join("", azurerm_container_registry.acr.*.admin_password)
}

output "registry_rg" {
  value = join("", azurerm_container_registry.acr.*.resource_group_name)
}

output "registry_role_acrpull" {
  value = azurerm_role_assignment.acrpull
}

output "registry_role_acrpush" {
  value = azurerm_role_assignment.acrpush
}
