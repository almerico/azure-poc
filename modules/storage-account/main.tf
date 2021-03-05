# Create a Resource Group for the Terraform State File
resource "azurerm_resource_group" "storage_account" {
  count = var.create ? (var.create_resoure_group ? 1 : 0) : 0
  name     = var.resoure_group
  location = var.location  
  lifecycle {
    prevent_destroy = false
  }  
  tags = {
    environment = var.environment
  }
}
# Create a Storage Account
resource "azurerm_storage_account" "storage_account" {
  count = var.create ? (var.create_resoure_group ? 1 : 0) : 0
  depends_on = [azurerm_resource_group.storage_account]
 
  name = var.storage_account
  resource_group_name = var.resoure_group
  location = var.location
  account_kind = var.storage_account_kind
  account_tier = var.storage_account_tier
  access_tier = var.storage_account_access_tier
  account_replication_type = var.storage_account_replication_type
  enable_https_traffic_only = var.storage_account_https_traffic_only
   
  lifecycle {
    prevent_destroy = false
  }  
  
  tags = {
    environment = var.environment
  }
}
