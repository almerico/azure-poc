output "key-vault-secrets" {
  value = azurerm_key_vault_secret.secret #values(azurerm_key_vault_secret.secret).*.value
}