variable "storage_account" {
  type         = string
  description  = "Storage Account Name for the Terraform State File"
  default      = ""
}

variable "storage_container" {
  type         = string
  description  = "Storage Container Name for the Terraform State File"
  default      = ""
}

variable "storage_account_rg" {
  type         = string
  description  = "Resource Group Name for the storage_account"
  default      = ""
}
