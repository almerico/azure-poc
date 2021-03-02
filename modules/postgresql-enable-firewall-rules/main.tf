
resource "azurerm_postgresql_firewall_rule" "enable_firewall" {
  count               = var.enabled ? 1 : 0

  name                = var.firewall_rule_name
  resource_group_name = var.resource_group_name
  server_name         = var.server_name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}


