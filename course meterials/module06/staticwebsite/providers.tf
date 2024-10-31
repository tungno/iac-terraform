terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.7.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-backend-tn"        # The name of the resource group to create the storage account in
    storage_account_name = "sabetnnj09n"          # The name of the storage account to create
    container_name       = "sasctn"               # The name of the blob container to create
    key                  = "web.terraform.sasctn" # The name of the blob to store the state file in
  }
}

provider "azurerm" {
  features {}
}