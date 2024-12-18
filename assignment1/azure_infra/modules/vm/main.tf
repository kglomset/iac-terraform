resource "azurerm_windows_virtual_machine_scale_set" "vmss" {
  name                 = var.vmssname
  resource_group_name  = var.rgname
  location             = var.location
  sku                  = "Standard_F2"
  instances            = 1
  admin_password       = var.password
  admin_username       = var.username
  computer_name_prefix = "vm-kwg-01"

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
    name    = "nic-vmss"
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = var.subnet_1_id
    }
  }
}