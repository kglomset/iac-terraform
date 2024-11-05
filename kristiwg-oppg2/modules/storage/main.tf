resource "random_string" "sa_suffix" {
  length  = 10
  special = false
  upper   = false
}

resource "azurerm_storage_account" "sa_ecom_platform" {
  name                     = "${lower(var.sa_name)}${random_string.sa_suffix.result}" 
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "ecom_storage_container" {
  name                  = var.sc_name
  storage_account_name  = azurerm_storage_account.sa_ecom_platform.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "ecom_storage_blob" {
  name                   = var.sb_name
  storage_account_name   = azurerm_storage_account.sa_ecom_platform.name
  storage_container_name = azurerm_storage_container.ecom_storage_container.name
  type                   = "Block"
}