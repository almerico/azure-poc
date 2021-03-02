
locals {
  storage_account     = var.storage_account != "" ? var.storage_account : ""
  storage_container   = var.storage_container != "" ? var.storage_container : "${local.storage_account}-tfstate"
  storage_account_rg  = var.storage_account_rg != "" ? var.storage_account_rg : ""
}