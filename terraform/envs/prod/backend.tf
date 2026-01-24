terraform {
  backend "azurerm" {
    resource_group_name  = "pkr-tfstate-rg"
    storage_account_name = "pk1tfstate001"
    container_name       = "tfstate"
    key                  = "pkr-prod.tfstate"
  }
}

