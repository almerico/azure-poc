variable "resource_group_name" {
  type = string
}
variable "server_name" {
  type = string
}

variable "allowed_cidrs" {
   description = "List of authorized cidrs for firewall rules"
   type = list(object({
    name              = string
    cidr              = string
  }))
  default = [] 
}
