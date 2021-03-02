output "vnet_id" {
  value = var.enable ? data.azurerm_virtual_network.vnet.id : ""
}

output "subnet_id" {
  value = var.enable ? (var.use_exisiting_subnet ? join("", data.azurerm_subnet.cluster_subnet.*.id) : join("", azurerm_subnet.cluster_subnet.*.id)) : ""
}
