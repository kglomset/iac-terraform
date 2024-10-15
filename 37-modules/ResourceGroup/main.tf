resource "azurerm_resource_group" "week37-resource-group" {
  name = "${var.base_name}-rg"
  location = var.location
}