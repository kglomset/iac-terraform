# Resource block that defines SQL server, database and server auditing policy

resource "azurerm_mssql_server" "ecom_mysql_server" {
  name                         = var.server_name
  resource_group_name          = var.rg_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.server_admin_username
  administrator_login_password = var.server_admin_pwd
  public_network_access_enabled = false
  minimum_tls_version          = "1.2"
}

resource "azurerm_mssql_database" "ecom_database" {
  name         = var.db_name
  server_id    = azurerm_mssql_server.ecom_mysql_server.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_mssql_server_extended_auditing_policy" "ecom_server_auditing_policy" {
  server_id                               = azurerm_mssql_server.ecom_mysql_server.id
  storage_endpoint                        = var.storage_endpoint
  storage_account_access_key              = var.sa_prim_access_key
  storage_account_access_key_is_secondary = false
  retention_in_days                       = 100
}