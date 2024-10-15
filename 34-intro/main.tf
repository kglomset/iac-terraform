terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.0.1"
    }
  }
}
 
provider "azurerm" {
  subscription_id = "70438f0b-03a6-455f-a559-dd257af223a9"
  features {
    
  }
}

resource "azurerm_resource_group" "first-deploy-rg" {
  name     = "rg-demo-we"
  location = "West Europe"
}

resource "azurerm_storage_account" "storage-account-test" {
  name = "kristiantest1"
  resource_group_name = azurerm_resource_group.first-deploy-rg.name
  location = azurerm_resource_group.first-deploy-rg.location
  account_tier = "Standard"
  account_replication_type = "GRS"
}