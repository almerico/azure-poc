data "azurerm_virtual_network" "vnet" {
  name                = var.network_name
  resource_group_name = var.resource_group
}

data "azurerm_subnet" "cluster_subnet" {
  count                = var.enable && var.use_exisiting_subnet ? 1 : 0

  name                 = var.subnet_name
  virtual_network_name = var.network_name
  resource_group_name  = var.resource_group
}

resource "azurerm_subnet" "cluster_subnet" {
  count               = var.enable && !var.use_exisiting_subnet ? 1 : 0

  name                 = var.subnet_name
  resource_group_name  = var.resource_group
  virtual_network_name = var.network_name
  address_prefixes     = var.address_prefixes

  enforce_private_link_endpoint_network_policies = true
  service_endpoints    = ["Microsoft.Sql","Microsoft.Storage"]
}

resource "azurerm_role_assignment" "aks_sp_network" {
  count               = var.enable ? 1 : 0

  scope                = data.azurerm_virtual_network.vnet.id
  role_definition_name = "Network Contributor"
  principal_id         = var.principal_id
}

