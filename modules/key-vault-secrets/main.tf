# Generate a random password
resource "random_password" "password" {
  for_each    = var.secrets
  length      = 20
  min_upper   = 2
  min_lower   = 2
  min_numeric = 2
  min_special = 2

  keepers = {
    name = each.key
  }
}

# Create an Azure Key Vault secrets
resource "azurerm_key_vault_secret" "secret" {
  for_each     = var.secrets
  key_vault_id = var.key_vault_id
  name         = each.key
  value        = lookup(each.value, "value") != "" ? lookup(each.value, "value") : random_password.password[each.key].result
  tags         = var.tags
  depends_on = [
    var.key_vault_id
  ]
}
