variable "create" {
  type        = bool
  description = "Create storage account"
  default     = true
}

variable "location" {
  type        = string
  description = "Azure region where the resource group will be created"
}

variable "environment" {
  type        = string
  description = "Name of the environment"
  default = ""
}

variable "create_resoure_group" {
  type        = bool
  description = "Create Resource Group"
}

variable "resoure_group" {
  type        = string
  description = "Resource Group Name"
}

variable "storage_account" {
  type        = string
  description = "Storage Account Name"
}

variable "storage_account_kind" {
  type        = string
  description = "Storage Account account_kind"
  default = "StorageV2"
}

variable "storage_account_tier" {
  type        = string
  description = "Storage Account account_tier"
  default = "Standard"
}

variable "storage_account_access_tier" {
  type        = string
  description = "Storage Account access_tier"
  default = "Hot"
}

variable "storage_account_replication_type" {
  type        = string
  description = "Storage Account account_replication_type"
  default = "ZRS"
}

variable "storage_account_https_traffic_only" {
  type        = bool
  description = "Enable https traffic only"
  default     = true
}
