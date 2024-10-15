terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.1"
    }
  }
}

provider "azurerm" {
  subscription_id = "70438f0b-03a6-455f-a559-dd257af223a9"
  features {}
}


resource "azurerm_resource_group" "rg-week-35" {
  name     = var.rgname
  location = var.location
}

resource "azurerm_storage_account" "storage-account-test" {
  name                     = var.saname
  resource_group_name      = azurerm_resource_group.rg-week-35.name
  location                 = azurerm_resource_group.rg-week-35.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}


resource "azurerm_network_security_group" "sg-group-week35" {
  name                = var.sgname
  location            = azurerm_resource_group.rg-week-35.location
  resource_group_name = azurerm_resource_group.rg-week-35.name
}

resource "azurerm_virtual_network" "vn-week35" {
  name                = var.vnname
  location            = azurerm_resource_group.rg-week-35.location
  resource_group_name = azurerm_resource_group.rg-week-35.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name             = var.snname1
    address_prefixes = ["10.0.1.0/24"]
  }

  subnet {
    name             = var.snname2
    address_prefixes = ["10.0.2.0/24"]
    security_group   = azurerm_network_security_group.sg-group-week35.id
  }

  tags = {
    environment = "Production"
  }
}

