locals {
  storage_account = var.create_storage_account && var.create_resoure_group ? module.storage_account.storage_account_name : var.storage_account
  storage_account_rg  = var.create_storage_account && var.create_resoure_group ? module.storage_account.storage_account_resource_group : var.storage_account_rg
  storage_container = var.storage_container != "" ? var.storage_container : "${local.storage_account}-tfstate"
}
