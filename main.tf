// ----------------------------------------------------------------------------
// Retrieve active subscription resources are being created in
// ----------------------------------------------------------------------------
data "azurerm_subscription" "current" {
}

data "azurerm_client_config" "current" {
}

module "vnet" {
  source = ".//modules/vnet"
  # resource_group = azurerm_resource_group.network.name
  create_vnet       = local.vnet.create
  module_depends_on = []
  depends_on        = [azurerm_resource_group.common]

  resource_group   = local.vnet.resource_group
  address_space    = local.vnet.address_space
  address_prefixes = local.vnet.address_prefixes
  network_name     = local.vnet.network_name
  subnet_name      = local.vnet.subnet_name
  location         = local.location

  principal_id = local.aks_sp_id
}

module "vnet_external" {
  source = ".//modules/vnet-external"
  # resource_group = azurerm_resource_group.network.name
  enable     = local.vnet_ext.enable
  depends_on = [azurerm_resource_group.common]

  resource_group       = local.vnet_ext.resource_group
  use_exisiting_subnet = local.vnet_ext.use_exisiting_subnet
  address_prefixes     = local.vnet_ext.address_prefixes
  network_name         = local.vnet_ext.network_name
  subnet_name          = local.vnet_ext.subnet_name

  principal_id = local.aks_sp_id
}

module "cluster" {
  source              = ".//modules/cluster"
  create_cluster      = local.cluster.create
  module_depends_on   = []
  depends_on          = [azurerm_resource_group.common]
  cluster_name        = local.cluster.name
  node_count          = local.cluster.node_count
  node_size           = local.cluster.node_size
  vnet_subnet_id      = local.subnet_id
  dns_prefix          = local.cluster.dns_prefix
  cluster_version     = local.cluster.cluster_version
  location            = local.location
  resource_group_name = local.cluster.resource_group
  create_admin_group  = local.cluster.create_admin_group
  admin_group_name    = local.cluster.admin_group_name

  network_resource_group = local.cluster.network_resource_group

  cluster_network_model      = local.cluster.cluster_network_model
  cluster_network_policy     = local.cluster.cluster_network_policy
  cluster_service_cidr       = local.cluster.cluster_service_cidr
  cluster_dns_service_ip     = local.cluster.cluster_dns_service_ip
  cluster_docker_bridge_cidr = local.cluster.cluster_docker_bridge_cidr
  cluster_pod_cidr           = local.cluster.cluster_pod_cidr
  cluster_load_balancer_sku  = local.cluster.cluster_load_balancer_sku

  node_resource_group_name = local.cluster.cluster_node_resource_group

  service_principal_client_id     = local.aks_sp_client_id
  service_principal_client_secret = local.aks_sp_client_secret
}

module "kubeconfig" {
  source         = ".//modules/kubeconfig"
  enabled        = local.cluster.create
  depends_on     = [module.cluster.cluster_endpoint]
  resource_group = module.cluster.resource_group_name
  cluster_name   = module.cluster.aks_cluster_name
}

/*
# optional additional policy
module "key_vault_policy" {
  source                          = "/modules/key-vault-policy" 
  key_vault_id                    = local.key-vault-id
  policies = var.policies
}
*/

# Add secret kubeconfig
module "key_vault_secrets_main" {
  source       = ".//modules/key-vault-secrets"
  key_vault_id = local.key-vault-id
  secrets = { kubeconfig = {
    value = module.kubeconfig.kubeconfig_output
    }
    storageAccountName = {
      value = local.storage_account.name
    }
    storageShareName = {
      value = local.storage_account.share_name
    }
    clusterEndpoint = {
      value = module.cluster.cluster_endpoint
    }
    clusterCaCertificate = {
      value = module.cluster.cluster_ca_certificate
    }
    clusterCertificate = {
      value = module.cluster.client_certificate
    }
    clusterKey = {
      value = module.cluster.client_key
    }
    clusterAdminUser = {
      value = module.cluster.cluster_kube_admin_config_username
    }
    clusterAdminPass = {
      value = module.cluster.cluster_kube_admin_config_password
    }
  }
  tags = {
    environment = local.environment
  }
}
