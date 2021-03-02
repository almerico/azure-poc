
resource "azurerm_mysql_virtual_network_rule" "vnet_rules" {
  count = length(var.allowed_subnets)

  name = format(
    "%s-%s",
    element(split("/", var.allowed_subnets[count.index]), 8), # VNet name
    element(split("/", var.allowed_subnets[count.index]), 10) # Subnet name
  )
  resource_group_name = var.resource_group_name
  server_name         = var.server_name
  subnet_id           = var.allowed_subnets[count.index]
}