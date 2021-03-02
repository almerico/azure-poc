resource "azurerm_postgresql_virtual_network_rule" "vnet_rules" {
  count = var.enabled && var.enable_subnet_rules ? length(var.allowed_subnets) : 0

  name = format(
    "%s-%s",
    element(split("/", var.allowed_subnets[count.index]), 8), # VNet name
    element(split("/", var.allowed_subnets[count.index]), 10) # Subnet name
  )
  resource_group_name = join("", azurerm_postgresql_server.postgresql.*.resource_group_name)
  server_name         = join("", azurerm_postgresql_server.postgresql.*.name)
  subnet_id           = var.allowed_subnets[count.index]
}