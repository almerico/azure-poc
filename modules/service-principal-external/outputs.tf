# Service principal
output "id" {
  value = join("", data.azuread_service_principal.sp.*.id)
  sensitive   = true
}

output "client_id" {
  value = join("", data.azuread_service_principal.sp.*.application_id)
  sensitive   = true
}

output "client_secret" {
  value = join("", data.azurerm_key_vault_secret.sp.*.value)
  sensitive   = true
}
