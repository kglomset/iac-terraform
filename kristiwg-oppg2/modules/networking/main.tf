module "rg_ecom_platform" {
  source   = "../resource_group"
  rg_name  = var.rg_name
  location = var.location
}

resource "azurerm_network_security_group" "ecom_sgroup" {
  name                = var.sg_name
  location            = module.rg_ecom_platform.location
  resource_group_name = module.rg_ecom_platform.rg_name
}

resource "azurerm_virtual_network" "ecom_vnet" {
  name                = var.vn_name
  location            = module.rg_ecom_platform.location
  resource_group_name = module.rg_ecom_platform.rg_name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  tags = {
    environment = "Production" ## Fix tags
  }
}

resource "azurerm_subnet" "ecom_snet" {
  name                 = var.subnet_name
  resource_group_name  = module.rg_ecom_platform.rg_name
  virtual_network_name = azurerm_virtual_network.ecom_vnet.name
  address_prefixes     = ["10.0.1.0/24"]

  delegation {
    name = "delegation"

    service_delegation {
      name    = "Microsoft.ContainerInstance/containerGroups"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
    }
  }
}

resource "azurerm_public_ip" "ecom_pub_ip" {
  name                = var.ip_lb_name
  location            = module.rg_ecom_platform.location
  resource_group_name = module.rg_ecom_platform.rg_name
  allocation_method   = "Static"
}

resource "azurerm_lb" "ecom_lb" {
  name                = var.lb_name
  location            = module.rg_ecom_platform.location
  resource_group_name = module.rg_ecom_platform.rg_name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.ecom_pub_ip.id
  }
}