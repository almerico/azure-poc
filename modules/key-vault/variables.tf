variable "enable" {
  type    = bool
  default = true
}

##################################
# Azure Resource Group variables #
##################################

variable "create_resource_group" {
  type        = bool
  default     = false
}

variable "resource_group_name" {
  type        = string
  description = "The name of an existing Resource Group"
}

variable "location" {
  type        = string
  description = "Define the region the Azure Key Vault should be created, you should use the Resource Group location"
}


#############################
# Azure Key Vault variables #
#############################

variable "name" {
  type        = string
  description = "The name of the Azure Key Vault"
}

variable "sku_name" {
  type        = string
  description = "Select Standard or Premium SKU"
  default     = "standard"
}

variable "enabled_for_deployment" {
  type        = string
  description = "Allow Azure Virtual Machines to retrieve certificates stored as secrets from the Azure Key Vault"
  default     = "true"
}

variable "enabled_for_disk_encryption" {
  type        = string
  description = "Allow Azure Disk Encryption to retrieve secrets from the Azure Key Vault and unwrap keys" 
  default     = "true"
}

variable "enabled_for_template_deployment" {
  type        = string
  description = "Allow Azure Resource Manager to retrieve secrets from the Azure Key Vault"
  default     = "true"
}

variable "kv-key-permissions" {
  type        = list(string)
  description = "List of full key permissions, must be one or more from the following: backup, create, decrypt, delete, encrypt, get, import, list, purge, recover, restore, sign, unwrapKey, update, verify and wrapKey."
  default     = [ "backup", "create", "decrypt", "delete", "encrypt", "get", "import", "list", "purge", 
                  "recover", "restore", "sign", "unwrapKey","update", "verify", "wrapKey", ]
}

variable "kv-secret-permissions" {
  type        = list(string)
  description = "List of full secret permissions, must be one or more from the following: backup, delete, get, list, purge, recover, restore and set"
  default     = [ "backup", "delete", "get", "list", "purge", "recover", "restore", "set", ]
} 

variable "kv-certificate-permissions" {
  type        = list(string)
  description = "List of full certificate permissions, must be one or more from the following: backup, create, delete, deleteissuers, get, getissuers, import, list, listissuers, managecontacts, manageissuers, purge, recover, restore, setissuers and update"
  default     = [ "create", "delete", "deleteissuers", "get", "getissuers", "import", "list", "listissuers", 
                  "managecontacts", "manageissuers", "purge", "recover", "setissuers", "update", "backup", "restore", ]
}

variable "kv-storage-permissions" {
  type        = list(string)
  description = "List of full storage permissions, must be one or more from the following: backup, delete, deletesas, get, getsas, list, listsas, purge, recover, regeneratekey, restore, set, setsas and update"
  default     = [ "backup", "delete", "deletesas", "get", "getsas", "list", "listsas", 
                  "purge", "recover", "regeneratekey", "restore", "set", "setsas", "update", ]
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "admin_groups" {
  type        = list(string)
  default     = []
}

