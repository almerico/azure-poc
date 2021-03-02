# Service principal
output "id" {
  value = join("", azuread_service_principal.aks_sp.*.object_id)
  sensitive   = true
}

output "client_id" {
  value = join("", azuread_service_principal.aks_sp.*.application_id)
  sensitive   = true
}

output "client_secret" {
  value = join("", azuread_service_principal_password.aks_sp.*.value)
  sensitive   = true
}
