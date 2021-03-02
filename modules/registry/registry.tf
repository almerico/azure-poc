resource "azurerm_container_registry" "acr" {
  count               = var.create_registry ? 1 : 0
  name                = var.container_registry_name
  resource_group_name = var.resource_group
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = var.admin_enabled
  tags                = var.tags
}

resource "azurerm_role_assignment" "acrpull" {
  count                = var.create_registry ? 1 : 0
  scope                = join("", azurerm_container_registry.acr.*.id)
  role_definition_name = "AcrPull"
  principal_id         = var.principal_id
}

resource "azurerm_role_assignment" "acrpush" {
  count                = var.create_registry ? 1 : 0
  scope                = join("", azurerm_container_registry.acr.*.id)
  role_definition_name = "AcrPush"
  principal_id         = var.principal_id
}
