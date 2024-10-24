module "rg_ecom_platform" {
  source = "../resource_group"
  rg_name = var.rg_name
  location = var.location
}

resource "azurerm_mssql_server" "ecom_msql_server" {
  name                         = var.server_name
  resource_group_name          = module.rg_ecom_platform.rg_name
  location                     = module.rg_ecom_platform.location
  version                      = "12.0"
  administrator_login          = var.server_admin_username
  administrator_login_password = var.server_admin_pwd
}

resource "azurerm_mssql_database" "ecom_database" {
  name         = var.db_name
  server_id    = azurerm_mssql_server.ecom_msql_server.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"

  tags = {
    foo = "bar"
  }

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}