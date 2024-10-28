terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.7.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "a686bba0-d6bf-491d-b5e4-bf385cf002db"
  features {
    
  }
}

resource "azurerm_resource_group" "tn-rg" {
  name     = "rg-name-tn" # Use a unique name for the resource group, prefix or suffix with your initials tim-demo-rg-we / rg-demo-we-tim
  location = "West Europe"
}

resource "azurerm_storage_account" "sa-demo-tn" {
  name                     = "saname123tn2024"
  resource_group_name      = azurerm_resource_group.tn-rg.name
  location                 = azurerm_resource_group.tn-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}