module "rg_ecom_platform" {
  source   = "../resource_group"
  rg_name  = var.rg_name
  location = var.location
}


resource "azurerm_service_plan" "ecom_service_plan" {
  name                = var.service_plan_name
  resource_group_name = module.rg_ecom_platform.rg_name
  location            = module.rg_ecom_platform.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}