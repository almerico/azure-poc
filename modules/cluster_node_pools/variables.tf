variable "create" {
  description = "Flag to indicate whether cluster node pool should be createed"
  type        = bool
}

variable "cluster_id" {
    type = string
}

# If enable_auto_scaling is set to true, then the following fields can also be configured
# max_count - (Required) The maximum number of nodes which should exist within this Node Pool. Valid values are between 0 and 1000 and must be greater than or equal to min_count.
# min_count - (Required) The minimum number of nodes which should exist within this Node Pool. Valid values are between 0 and 1000 and must be less than or equal to max_count.
# node_count - (Optional) The initial number of nodes which should exist within this Node Pool. Valid values are between 0 and 1000 and must be a value in the range

# If enable_auto_scaling is set to false, then the following fields can also be configured:
# node_count - (Required) The number of nodes which should exist within this Node Pool. Valid values are between 0 and 1000.

variable "node_pools" {
   description = "List of node pools"
   type = list(object({
    name                    = string
    vm_size                 = string
    enable_auto_scaling     = bool          
    max_count               = number        
    min_count               = number        
    node_count              = number 

    enable_node_public_ip   = bool
    priority                = string  
    eviction_policy         = string        # Possible values are Deallocate and Delete, can only be configured when priority is set to Spot. 
    max_pods                = number
    mode                    = string        # Possible values are System and User. Defaults to User.
  }))
  default = [] 
}

variable "environment" {
    type = string
}

