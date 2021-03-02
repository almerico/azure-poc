data "azurerm_client_config" "current" {}

data "azuread_group" "admins" { 
  count = var.enable ? length(var.admin_groups) : 0
  name = var.admin_groups[count.index]
} 

# Create a resource group for security
resource "azurerm_resource_group" "key-vault-rg" {
  count    = (var.enable && var.create_resource_group) ? 1 : 0
  name     = var.resource_group_name
  location = var.location
}


# Create the Azure Key Vault
resource "azurerm_key_vault" "key-vault" {
  count               = var.enable ? 1 : 0
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  depends_on          = [azurerm_resource_group.key-vault-rg]
  
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment

  tenant_id = data.azurerm_client_config.current.tenant_id
  sku_name  = var.sku_name
  tags      = var.tags

  # Comment this part if 
  # resource "azurerm_key_vault_access_policy" "current" is used
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id
    key_permissions = var.kv-key-permissions
    secret_permissions = var.kv-secret-permissions
    certificate_permissions = var.kv-certificate-permissions
    storage_permissions = var.kv-storage-permissions
  }
  #
  network_acls {
    default_action = "Allow"
    bypass         = "AzureServices"
  }
}

/*
resource "azurerm_key_vault_access_policy" "current" {
  count        = var.enable ? 1 : 0

  key_vault_id = join("", azurerm_key_vault.key-vault.*.id)
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  key_permissions = var.kv-key-permissions
  secret_permissions = var.kv-secret-permissions
  certificate_permissions = var.kv-certificate-permissions
  storage_permissions = var.kv-storage-permissions
}
*/

resource "azurerm_key_vault_access_policy" "admins" {
  count        = var.enable ? length(var.admin_groups) : 0

  key_vault_id = join("", azurerm_key_vault.key-vault.*.id)
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azuread_group.admins[count.index].id 

  key_permissions = var.kv-key-permissions
  secret_permissions = var.kv-secret-permissions
  certificate_permissions = var.kv-certificate-permissions
  storage_permissions = var.kv-storage-permissions
}

