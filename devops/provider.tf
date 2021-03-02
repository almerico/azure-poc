terraform {
  required_version = ">= 0.13.0"
}

provider "azurerm" {
  version = "2.36.0"
  features {}
}

provider "azuread" {
  version = "0.11.0"
}

provider "random" {
  version = "3.0.0"
}

provider "local" {
  version = "1.4.0"
}
