output "storage_endpoint" {
  value = azurerm_storage_account.sa_ecom_platform.primary_blob_endpoint
  description = "Primary blob endpoint of the storage account"
}

output "sa_primary_access_key" {
  value = azurerm_storage_account.sa_ecom_platform.primary_access_key
  description = "Primary access key of the storage account"
}