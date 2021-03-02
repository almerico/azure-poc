variable "enabled" {
  type        = bool
  default     = true
}

variable "postgresql_databases" {
  type = list(object({
    name             = string
    charset          = string
    collation        = string
  }))
  default = [] 
}

variable "server_name" {
  type = string
}

variable "resource_group" {
  type = string
}