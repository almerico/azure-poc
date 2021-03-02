output "vnet_id" {
  value = join("", azurerm_virtual_network.cluster.*.id)
}

output "subnet_id" {
  value = join("", azurerm_subnet.cluster_subnet.*.id)
}