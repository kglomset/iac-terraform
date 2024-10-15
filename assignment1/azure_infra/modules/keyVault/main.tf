provider "azurerm" {
  subscription_id = "70438f0b-03a6-455f-a559-dd257af223a9"
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv-asgnmnt1" {
  name                        = var.keyvaultname
  location                    = var.location
  resource_group_name         = var.rgname
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

resource "azurerm_key_vault_secret" "sa-access-key" {
  name         = "accesskey"
  value        = var.sa-access-key
  key_vault_id = azurerm_key_vault.kv-asgnmnt1.id
}

resource "azurerm_key_vault_secret" "vm-username" {
  name         = "username"
  value        = var.username
  key_vault_id = azurerm_key_vault.kv-asgnmnt1.id
}

resource "azurerm_key_vault_secret" "vm-password" {
  name         = "password"
  value        = var.password
  key_vault_id = azurerm_key_vault.kv-asgnmnt1.id
}