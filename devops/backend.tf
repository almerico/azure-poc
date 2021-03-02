# Set values which you see in output of init module
terraform {
  backend "azurerm" {
    resource_group_name  = "OIT-DEV-ALFR"
    storage_account_name = "saalfr"
    container_name       = "saalfr-tfstate"

    key = "alfresco_dev.devops.tfstate"
  }
}
