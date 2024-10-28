resource "azurerm_resource_group" "rg_ecom_platform" {
  name     = var.rg_name
  location = var.location
}