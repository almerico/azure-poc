module "enable_firewall_rules" {
  source                          = "..//postgresql-enable-firewall-rules" 
  enabled                         = var.enabled && var.enable_firewall_rules
  firewall_rule_name              = "${var.server_name}-enable"
  resource_group_name             = join("", azurerm_postgresql_server.postgresql.*.resource_group_name)
  server_name                     = join("", azurerm_postgresql_server.postgresql.*.name)
}

module "firewall_rules" {
  source                          = "..//postgresql-firewall-rules" 
  allowed_cidrs                   = var.enabled && var.enable_firewall_rules ? var.allowed_cidrs : []
  resource_group_name             = join("", azurerm_postgresql_server.postgresql.*.resource_group_name)
  server_name                     = join("", azurerm_postgresql_server.postgresql.*.name)
}

