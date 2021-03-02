variable "enabled" {
  type        = bool
  default     = true
}

variable "module_depends_on" {
  type        = any
  default     = []
}

# company prefix 
variable "prefix" {
  type        = string
  description = "This variable defines the company name prefix used to build resources"
  default     = ""
}

variable "environment" {
    type = string
}

variable "location" {
  type    = string
}

variable "create_resource_group" {
  type        = bool
  default     = true
}

variable "resource_group" {
  type = string
}

variable "server_name" {
  type = string
}

variable "admin-login" {
  type        = string
  description = "Login to authenticate to MySQL Server"
}

variable "admin-password" {
  type        = string
  description = "Password to authenticate to MySQL Server"
}

variable "server_version" {
  type        = string
  description = "PostgreSQL Server version to deploy"
  default     = "11"
}

variable "sku-name" {
  type        = string
  description = "MySQL SKU Name"
  default     = "B_Gen5_1"
}

variable "storage" {
  type        = string
  description = "MySQL Storage in MB, from 5120 MB to 4194304 MB"
  default     = "5120"
}

variable "auto_grow_enabled" {
  type        = bool
  default     = true
}

variable "backup_retention_days" {
  type        = number
  default     = 7
}

variable "geo_redundant_backup_enabled" {
  type        = bool
  default     = false
}

variable "public_network_access_enabled" {
  type        = bool
  default     = false
}

variable "ssl_enforcement_enabled" {
  type        = bool
  default     = true
}

variable "ssl_minimal_tls_version_enforced" {
  type        = string
  default     = "TLS1_2"
}

variable "extra_tags" {
  type        = map(string)
  description = "Map of custom tags"
  default     = {}
}


## Private endpoint
variable "private_endpoint_enabled" {
  type        = bool
  default     = false
}

variable "private_endpoints" {
  type = list(object({
    name            = string
    subnet_id       = string
  }))
  default = [] 
}

variable "private_sc_name" {
  type        = string
  description = "private_service_connection name"
  default     = ""
}

variable "subresource_names" {
  description = "A list of subresource names which the Private Endpoint is able to connect to. subresource_names corresponds to group_id"
  type        = list(string)
  default     = [ "postgresqlServer" ] 
}

variable "is_manual_connection" {
  type        = bool
  default     = false
}

##firewall rules
variable "enable_firewall_rules" {
  type        = bool
  default     = false
}

variable "allowed_cidrs" {
   description = "List of authorized cidrs for firewall rules"
   type = list(object({
    name              = string
    cidr              = string
  }))
  default = [] 
}

##vnet rules
variable "enable_subnet_rules" {
  type        = bool
  default     = true
}

variable "allowed_subnets" {
   description ="List of authorized subnet ids"
   type = list(string)
}


