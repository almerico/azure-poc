variable "create_cluster" {
  description = "Flag to indicate whether a cluster should be createed"
  type        = bool
}

variable "create_admin_group" {
  description = "Flag to indicate whether admin user group should be createed"
  type        = bool
}

variable "admin_group_name" {
  description = "Admin group name"
  type        = string
}

variable "create_kubeconfig" {
  description = "Flag to indicate whether a local kubeconfig file should be createed"
  type        = bool
  default     = false
}

variable "module_depends_on" {
  type = any
}

variable "cluster_name" {
  type = string
}
variable "cluster_version" {
  description = "Kubernetes version to use for the AKS cluster."
  type        = string
}
variable "location" {
  type = string
}
variable "node_size" {
  type = string
}
variable "node_count" {
  type = string
}
variable "vnet_subnet_id" {
  type = string
}
variable "dns_prefix" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "node_resource_group_name" {
  type = string
}
variable "network_resource_group" {
  type = string
}
# Use azure-cni for advanced networking
variable "cluster_network_model" {
  type    = string
  default = "kubenet"
}

# Sets up network policy to be used with Azure CNI. Currently supported values are calico and azure."
variable "cluster_network_policy" {
  type    = string
  default = "azure"
}

variable "cluster_service_cidr" {
  type    = string
  default = ""
}

variable "cluster_dns_service_ip" {
  type    = string
  default = ""
}

variable "cluster_docker_bridge_cidr" {
  type    = string
  default = ""
}

variable "cluster_pod_cidr" {
  type    = string
  default = null
}

variable "cluster_load_balancer_sku" {
  type    = string
  default = "basic"
}


variable "service_principal_client_id" {
  type    = string
}

variable "service_principal_client_secret" {
  type    = string
}