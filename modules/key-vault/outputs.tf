output "key-vault-id" {
  description = "Key Vault ID"
  value       = join("", azurerm_key_vault.key-vault.*.id)
}

output "key-vault-name" {
  description = "Key Vault Name"
  value       = join("", azurerm_key_vault.key-vault.*.name)
}

output "key-vault-rg-name" {
  description = "Resource Group Name"
  value       = join("", azurerm_key_vault.key-vault.*.resource_group_name)
}

output "key-vault-url" {
  description = "Key Vault URI"
  value       = join("", azurerm_key_vault.key-vault.*.vault_uri)
}


