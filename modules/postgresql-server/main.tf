# Create a Resource Group for MySQL
resource "azurerm_resource_group" "postgresql_rg" {
  count = var.create_resource_group ? 1 : 0
  name     = local.resource_group
  location = var.location
}

resource "azurerm_postgresql_server" "postgresql" {
  count = var.enabled ? 1 : 0
  name = local.server_name
  location = var.location
  resource_group_name = local.resource_group

  administrator_login          = var.admin-login
  administrator_login_password = var.admin-password

  sku_name   = var.sku-name
  version  = var.server_version
  storage_mb = var.storage

  auto_grow_enabled = var.auto_grow_enabled
  backup_retention_days        = var.backup_retention_days
  geo_redundant_backup_enabled = var.geo_redundant_backup_enabled
  public_network_access_enabled = var.public_network_access_enabled

  ssl_enforcement_enabled           = var.ssl_enforcement_enabled
  ssl_minimal_tls_version_enforced  = var.ssl_minimal_tls_version_enforced

  tags = merge(local.default_tags, var.extra_tags)
}


 

