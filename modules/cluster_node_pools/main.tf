resource "azurerm_kubernetes_cluster_node_pool" "aks" {
    count = var.create ? length(var.node_pools) : 0
    kubernetes_cluster_id = var.cluster_id

    name                  = var.node_pools[count.index].name
    vm_size               = var.node_pools[count.index].vm_size
    enable_auto_scaling   = var.node_pools[count.index].enable_auto_scaling
    max_count             = var.node_pools[count.index].enable_auto_scaling ? var.node_pools[count.index].max_count : null
    min_count             = var.node_pools[count.index].enable_auto_scaling ? var.node_pools[count.index].min_count : null
    node_count            = var.node_pools[count.index].node_count

    enable_node_public_ip = var.node_pools[count.index].enable_node_public_ip
    priority              = var.node_pools[count.index].priority
    eviction_policy       = var.node_pools[count.index].eviction_policy
    max_pods              = var.node_pools[count.index].max_pods
    mode                  = var.node_pools[count.index].mode   
    tags = {
        Environment = var.environment
    }
}
