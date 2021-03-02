variable "resource_group_name" {
  type = string
}
variable "server_name" {
  type = string
}

variable "allowed_subnets" {
   description ="List of authorized subnet ids"
   type = list(string)
}
