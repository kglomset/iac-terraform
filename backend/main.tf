terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.3.0"
    }
  }
  
  backend "azurerm" {
    resource_group_name  = "rg-backend-tfstate-kwg"
    storage_account_name = "sabackendkwgxj8te6ry5p"
    container_name       = "tfstate"
    key                  = "backend.terraform.tfstate"
  }

}

provider "azurerm" {
  subscription_id = "70438f0b-03a6-455f-a559-dd257af223a9"
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}

resource "random_string" "random_string" {
  length  = 10
  special = false
  upper   = false
}

resource "azurerm_resource_group" "rg-backend" {
  name     = var.rg_backend_name
  location = var.location_backend
}

resource "azurerm_storage_account" "sa-backend" {
  name                     = "${lower(var.sa_backend_name)}${random_string.random_string.result}"
  resource_group_name      = azurerm_resource_group.rg-backend.name
  location                 = azurerm_resource_group.rg-backend.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "sc-backend" {
  name                  = var.sc_backend_name
  storage_account_name  = azurerm_storage_account.sa-backend.name
  container_access_type = "private"
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv-backend" {
  name                        = "${lower(var.kv_backend_name)}${random_string.random_string.result}"
  location                    = azurerm_resource_group.rg-backend.location
  resource_group_name         = azurerm_resource_group.rg-backend.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get", "Update", "Create", "List", "Delete", "Purge", "Recover"
    ]

    secret_permissions = [
      "Get", "Set", "List", "Delete", "Purge", "Recover"
    ]

    storage_permissions = [
      "Get", "Set", "List", "Delete", "Purge", "Recover"
    ]
  }
}

resource "azurerm_key_vault_secret" "sa-backend-access-key" {
  name         = var.sa_backend_accesskey_name
  value        = azurerm_storage_account.sa-backend.primary_access_key
  key_vault_id = azurerm_key_vault.kv-backend.id
}