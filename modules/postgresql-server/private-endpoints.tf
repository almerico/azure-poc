# Private endpoints feature is supported only on General Purpose and Memory Optimized pricing tiers of Azure Database for MySQL.
# For manual approval of private endpoint connection, you can use is_manual_connection = true
resource "azurerm_private_endpoint" "postgresql" {
  count = var.enabled && var.private_endpoint_enabled ? length(var.private_endpoints) : 0

  location            = var.location
  resource_group_name = local.resource_group
  
  name                = var.private_endpoints[count.index].name
  subnet_id           = var.private_endpoints[count.index].subnet_id

  private_service_connection {
    name                           = local.private_sc_name
    private_connection_resource_id = join("", azurerm_postgresql_server.postgresql.*.id)
    subresource_names              = var.subresource_names
    is_manual_connection           = var.is_manual_connection
  }
}
