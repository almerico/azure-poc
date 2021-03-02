# Create a Storage Container for the Core State File
data "azurerm_storage_account" "account" {
  name                = local.storage_account 
  resource_group_name = local.storage_account_rg
}

resource "azurerm_storage_container" "core-container" {
  name                 = local.storage_container
  storage_account_name = data.azurerm_storage_account.account.name
}
