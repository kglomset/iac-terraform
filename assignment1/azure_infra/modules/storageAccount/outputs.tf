output "storage_account_name" {
  value       = var.sa_name
  description = "Name of the storage account"
}

output "sa_access_key" {
  value       = azurerm_storage_account.rg-oblig-1.primary_access_key
  description = "Storage account access key"
}