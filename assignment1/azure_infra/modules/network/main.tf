resource "azurerm_network_security_group" "nsg" {
  name                = var.nsgname
  location            = var.location
  resource_group_name = var.rgname
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnetname
  location            = var.location
  resource_group_name = var.rgname
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  tags = {
    environment = "Production"
  }
}

resource "azurerm_subnet" "subnet1" {
  name                 = var.subnetname1
  resource_group_name  = var.rgname
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "subnet2" {
  name                 = var.subnetname2
  resource_group_name  = var.rgname
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_subnet_network_security_group_association" "nsg-subnet1" {
  subnet_id                 = azurerm_subnet.subnet1.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_subnet_network_security_group_association" "nsg-subnet2" {
  subnet_id                 = azurerm_subnet.subnet2.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
