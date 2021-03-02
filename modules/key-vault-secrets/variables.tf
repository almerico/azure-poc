variable "secrets" {
  type = map(object({
    value = string
  }))
  description = "Define Azure Key Vault secrets"
  default = {}
}
variable "key_vault_id" {
    type = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}