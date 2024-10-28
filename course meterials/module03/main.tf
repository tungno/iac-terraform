terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.7.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "a686bba0-d6bf-491d-b5e4-bf385cf002db"
  features {

  }
}

resource "azurerm_resource_group" "rgwe" {
  name     = var.rgname
  location = var.az_regions[0]
  tags     = local.common_tags
}

resource "azurerm_storage_account" "sa-demo" {
  count                    = length(var.storage_account_names)
  name                     = var.storage_account_names[count.index]
  resource_group_name      = azurerm_resource_group.rgwe.name
  location                 = azurerm_resource_group.rgwe.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = local.common_tags

}