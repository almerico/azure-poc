resource "azurerm_virtual_network" "cluster" {
  count               = var.create_vnet ? 1 : 0

  name                = var.network_name
  resource_group_name = var.resource_group
  location            = var.location
  address_space       = var.address_space
}
resource "azurerm_subnet" "cluster_subnet" {
  count               = var.create_vnet ? 1 : 0

  name                 = var.subnet_name
  resource_group_name  = var.resource_group
  virtual_network_name = join("", azurerm_virtual_network.cluster.*.name)
  address_prefixes     = var.address_prefixes

  enforce_private_link_endpoint_network_policies = true
  service_endpoints    = ["Microsoft.Sql","Microsoft.Storage"]
}

resource "azurerm_role_assignment" "aks_sp_network" {
  count               = var.create_vnet ? 1 : 0

  scope                = join("", azurerm_virtual_network.cluster.*.id)
  role_definition_name = "Network Contributor"
  principal_id         = var.principal_id
}

