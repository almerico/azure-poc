# Service principal is defined externally
data "azuread_service_principal" "sp" {
  count        = var.enable ? 1 : 0
  display_name = var.sp_name
}

data "azurerm_key_vault" "sp" {
  count               = var.enable ? 1 : 0
  name                = var.kv_name
  resource_group_name = var.kv_resource_group
}

data "azurerm_key_vault_secret" "sp" {
  count        = var.enable ? 1 : 0
  name         = var.kv_secret_name
  key_vault_id = join("", data.azurerm_key_vault.sp.*.id)
}
