output "cluster_id" {
  value = join("", azurerm_kubernetes_cluster.aks.*.id) 
}
output "fqdn" {
  value = join("", azurerm_kubernetes_cluster.aks.*.fqdn) 
}
output "cluster_endpoint" {
  value = join("", azurerm_kubernetes_cluster.aks.*.kube_admin_config.0.host)  
}
output "client_certificate" {
  sensitive = true
  value = join("", azurerm_kubernetes_cluster.aks.*.kube_admin_config.0.client_certificate)  
}
output "client_key" {
  sensitive = true
  value = join("", azurerm_kubernetes_cluster.aks.*.kube_admin_config.0.client_key)  
}
output "cluster_ca_certificate" {
  sensitive = true
  value = join("", azurerm_kubernetes_cluster.aks.*.kube_admin_config.0.cluster_ca_certificate)  
}
output "cluster_kube_admin_config_username" {
  sensitive = true
  value = join("", azurerm_kubernetes_cluster.aks.*.kube_admin_config.0.username)  
}
output "cluster_kube_admin_config_password" {
  sensitive = true
  value = join("", azurerm_kubernetes_cluster.aks.*.kube_admin_config.0.password)  
}
output "cluster_kube_admin_config_raw" {
  sensitive = true
  value = join("", azurerm_kubernetes_cluster.aks.*.kube_admin_config_raw)  
}
output "node_resource_group" {
  value = join("", azurerm_kubernetes_cluster.aks.*.node_resource_group) 
}
output "kubelet_identity_id" {
  sensitive = true
  value = var.create_cluster ? element(concat(azurerm_kubernetes_cluster.aks.0.kubelet_identity[*].object_id, list("")), 0) : ""
}
output "aks_cluster_name" {
  value = join("", azurerm_kubernetes_cluster.aks.*.name) 
}
output "resource_group_name" {
  value = join("", azurerm_kubernetes_cluster.aks.*.resource_group_name) 
}
