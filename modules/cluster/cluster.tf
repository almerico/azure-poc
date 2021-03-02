resource "azurerm_kubernetes_cluster" "aks" {
  count    = var.create_cluster ? 1 : 0

  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  node_resource_group = var.node_resource_group_name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.cluster_version

  # private_cluster_enabled = true

  default_node_pool {
    name           = "default"
    vm_size        = var.node_size
    vnet_subnet_id = var.vnet_subnet_id
    node_count     = var.node_count
  }

  network_profile {
    network_plugin     = var.cluster_network_model
    network_policy     = var.cluster_network_policy
    service_cidr       = var.cluster_service_cidr
    dns_service_ip     = var.cluster_dns_service_ip
    docker_bridge_cidr = var.cluster_docker_bridge_cidr
    pod_cidr           = var.cluster_pod_cidr
    load_balancer_sku  = var.cluster_load_balancer_sku
    # outbound_type      = "userDefinedRouting"
  }

  role_based_access_control {
    enabled = true
    azure_active_directory {
      managed = true
      admin_group_object_ids  = [local.admin_group_id] 
    }
  }

  service_principal {
    client_id     = var.service_principal_client_id
    client_secret = var.service_principal_client_secret
  }

}