module "resource_group" {
  source   = "../resource_group"
  rg_name  = var.rg_name
  location = var.location
}

resource "random_string" "sa_suffix" {
  length  = 10
  special = false
  upper   = false
}

resource "azurerm_storage_account" "sa_ecom_platform" {
  name                     = "${lower(var.sa_name)}${random_string.sa_suffix.result}" ## CorrecT?
  resource_group_name      = module.resource_group.rg_name
  location                 = module.rg_ecom_platform.location
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
  source                 = "some-local-file.zip" ## Gjøre noe med denne?
}