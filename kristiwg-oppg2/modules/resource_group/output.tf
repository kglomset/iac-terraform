output "rg_name" {
  value       = azurerm_resource_group.rg_ecom_platform.name
  description = "Name of the resource group"
}

output "location" {
  value       = azurerm_resource_group.rg_ecom_platform.location
  description = "Location of the resource group"
}