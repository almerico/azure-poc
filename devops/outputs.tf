# Key vault
output "key-vault-id" {
  description = "Key Vault ID"
  value       = module.key_vault.key-vault-id
}
output "key-vault-name" {
  description = "Key Vault Name"
  value       = module.key_vault.key-vault-name
}

output "key-vault-rg-name" {
  description = "Key Vault Name"
  value       = module.key_vault.key-vault-rg-name
}

output "key-vault-url" {
  description = "Key Vault URI"
  value       = module.key_vault.key-vault-url
}

# Registry
output "registry_server" {
  value = module.registry.registry_login_server
}

output "registry_admin_enabled" {
  value = module.registry.registry_admin_enabled
}

output "registry_admin_username" {
  value = module.registry.registry_admin_username
}

#output "registry_admin_password" {
# value = module.registry.registry_admin_password
#}

output "registry_id" {
  value = module.registry.registry_id
}

output "registry_rg" {
  value = module.registry.registry_rg
}

# Service principal
output "service_principal_id" {
  value = local.service_principal_id
}
