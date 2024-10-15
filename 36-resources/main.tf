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


resource "azurerm_resource_group" "kwg-rg-week36" {
  name     = var.rgname
  location = var.location
  tags     = local.common_tags
}

# Storage account 1
resource "azurerm_storage_account" "storage-account-1" {
  name                     = var.sa1name
  resource_group_name      = azurerm_resource_group.kwg-rg-week36.name
  location                 = azurerm_resource_group.kwg-rg-week36.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags                     = local.common_tags
}

#Storage account 2
resource "azurerm_storage_account" "storage-account-2" {
  name                     = var.sa2name
  resource_group_name      = azurerm_resource_group.kwg-rg-week36.name
  location                 = azurerm_resource_group.kwg-rg-week36.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags                     = local.common_tags
}

#Storage account 3
resource "azurerm_storage_account" "storage-account-3" {
  name                     = var.sa3name
  resource_group_name      = azurerm_resource_group.kwg-rg-week36.name
  location                 = azurerm_resource_group.kwg-rg-week36.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags                     = local.common_tags
}



resource "azurerm_network_security_group" "sg-group-1-week36" {
  name                = var.sg1name
  location            = azurerm_resource_group.kwg-rg-week36.location
  resource_group_name = azurerm_resource_group.kwg-rg-week36.name
  tags                = local.common_tags
}

resource "azurerm_network_security_group" "sg-group-2-week36" {
  name                = var.sg2name
  location            = azurerm_resource_group.kwg-rg-week36.location
  resource_group_name = azurerm_resource_group.kwg-rg-week36.name
  tags                = local.common_tags
}

resource "azurerm_virtual_network" "vn1-week36" {
  name                = var.vn1name
  location            = azurerm_resource_group.kwg-rg-week36.location
  resource_group_name = azurerm_resource_group.kwg-rg-week36.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name             = var.snname1
    address_prefixes = ["10.0.1.0/24"]
  }

  subnet {
    name             = var.snname2
    address_prefixes = ["10.0.2.0/24"]
    security_group   = azurerm_network_security_group.sg-group-1-week36.id
  }

  tags = {
    environment = "Production"
  }
}

resource "azurerm_virtual_network" "vn2-week36" {
  name                = var.vn2name
  location            = azurerm_resource_group.kwg-rg-week36.location
  resource_group_name = azurerm_resource_group.kwg-rg-week36.name
  address_space       = ["10.1.0.0/16"]
  dns_servers         = ["10.0.0.2", "10.0.0.3"]

  subnet {
    name             = var.snname3
    address_prefixes = ["10.1.3.0/24"]
  }

  subnet {
    name             = var.snname4
    address_prefixes = ["10.1.4.0/24"]
    security_group   = azurerm_network_security_group.sg-group-2-week36.id
  }

  tags = {
    environment = "Production"
  }
}

output "said" {
  value = azurerm_storage_account.storage-account-1.id
}
