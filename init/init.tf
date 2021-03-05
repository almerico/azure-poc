# Create a Storage Account if needed
module "storage_account" {
  source                = "../modules/storage-account"
  create                = var.create_storage_account
  location              = var.location
  environment           = var.environment
  create_resoure_group  = var.create_resoure_group
  resoure_group         = var.storage_account_rg
  storage_account       = var.storage_account
}

resource "azurerm_storage_container" "core-container" {
  name                 = local.storage_container
  storage_account_name = local.storage_account
}
