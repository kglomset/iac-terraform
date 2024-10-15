terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.1.0"
    }
  }
}

resource "azurerm_storage_account" "rg-oblig-1" {
  name                     = var.sa_name
  resource_group_name      = var.rgname
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "sa_container" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.rg-oblig-1.name
  container_access_type = "private"
}