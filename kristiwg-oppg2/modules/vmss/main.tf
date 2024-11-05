resource "azurerm_windows_virtual_machine_scale_set" "ecom_vmss" {
  name                 = var.vmss_name
  resource_group_name  = var.rg_name
  location             = var.location
  sku                  = var.vmss_sku
  instances            = 1
  admin_password       = var.vmss_admin_password
  admin_username       = var.vmss_admin_username
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
    name    = var.vmss_nic
    primary = true

    ip_configuration {
      name      = var.vmss_nic_ip_config
      primary   = true
      subnet_id = var.subnet_id
    }
  }
}