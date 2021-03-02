variable "create_vnet" {
  description = "Flag to indicate whether a vnet should be createed"
  type        = bool
  default     = true
}
variable "module_depends_on" {
  type = any
}

variable "resource_group" {
  type = string
}

variable "address_space" {
  type        = list(string)
  default     = [] 
}

variable "address_prefixes" {
  type        = list(string)
  default     = [] 
}

variable "network_name" {
  type = string
}
variable "subnet_name" {
  type = string
}
variable "location" {
  type = string
}
variable "principal_id" {
  type = string
}