# Create a MySQL Database
resource "azurerm_postgresql_database" "postgresql-db" {
  count               = var.enabled ? length(var.postgresql_databases) : 0
  name                = var.postgresql_databases[count.index].name
  resource_group_name = var.resource_group
  server_name         = var.server_name
  charset             = var.postgresql_databases[count.index].charset
  collation           = var.postgresql_databases[count.index].collation
}
