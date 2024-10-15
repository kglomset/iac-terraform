resource "azurerm_network_security_group" "week40-sg-kwg" {
  name                = var.sg_name
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_virtual_network" "week40-vn-kwg" {
  name                = var.vn_name
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  tags = {
    environment = "Production"
  }
}

resource "azurerm_subnet" "subnet-1" {
    name             = var.subnet1_name
    virtual_network_name = azurerm_virtual_network.week40-vn-kwg.name
    resource_group_name = var.rg_name   
    address_prefixes = ["10.0.1.0/24"]
}

resource "azurerm_windows_virtual_machine_scale_set" "week40-vmss-kwg" {
  name                 = var.vmss_name
  resource_group_name  = var.rg_name
  location             = var.location
  sku                  = "Standard_F2"
  instances            = 1
  admin_password       = "P@55w0rd1234!"
  admin_username       = "adminuser"
  computer_name_prefix = "vm-"

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter-Server-Core"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "example"
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = azurerm_subnet.subnet-1.id
    }
  }
}