variable "create_storage_account" {
  type         = bool
  description  = "Create a Storage Account"
  default      = false
}

variable "location" {
  type        = string
  description = "Azure region"
  default     =  "West US"
}

variable "environment" {
  type        = string
  description = "Name of the environment"
  default = ""
}

variable "create_resoure_group" {
  type        = bool
  description = "Create Resource Group"
  default     = false
}

variable "storage_account" {
  type         = string
  description  = "Storage Account Name for the Terraform State File"
}

variable "storage_account_rg" {
  type         = string
  description  = "Resource Group Name for the storage_account"
}

variable "storage_container" {
  type         = string
  description  = "Storage Container Name for the Terraform State File"
  default      = ""
}
