# This resource block defines network related infrastructure, such as security group, virtual network, 
# subnet, public IP and load balancer.

resource "azurerm_network_security_group" "ecom_sgroup" {
  name                = var.sg_name
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_virtual_network" "ecom_vnet" {
  name                = var.vn_name
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

}

resource "azurerm_subnet" "ecom_snet" {
  name                 = var.subnet_name
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.ecom_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "ecom_pub_ip" {
  name                = var.ip_name
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
}

resource "azurerm_lb" "ecom_lb" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.rg_name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.ecom_pub_ip.id
  }
}

resource "azurerm_lb_probe" "lb_http_probe" {
  loadbalancer_id     = azurerm_lb.ecom_lb.id
  name                = "http-running-probe"
  protocol            = "Http"
  port                = 80
  request_path        = "/"
  interval_in_seconds = 5
  number_of_probes    = 2
}

resource "azurerm_lb_rule" "lb_http_rule" {
  loadbalancer_id                = azurerm_lb.ecom_lb.id
  name                           = "http-rule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress"
  probe_id                       = azurerm_lb_probe.lb_http_probe.id
}