variable "enable" {
  type        = bool
  default     = false
}

variable "resource_group" {
  type = string
}

variable "network_name" {
  type = string
}

variable "address_prefixes" {
  type        = list(string)
  default     = [] 
}


variable "use_exisiting_subnet" {
  type        = bool
}

variable "subnet_name" {
  type = string
}

variable "principal_id" {
  type = string
}