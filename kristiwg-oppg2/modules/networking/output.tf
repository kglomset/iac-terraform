output "ecom_snet_id" {
  value       = azurerm_subnet.ecom_snet.id
  description = "The subnet ID of the virtual network"
}

output "ecom_vnet_id" {
  value       = azurerm_virtual_network.ecom_vnet.id
  description = "The ID of the virtual network"
}

output "ecom_sg_id" {
  value       = azurerm_network_security_group.ecom_sgroup.id
  description = "The ID of the security group"
}

output "ecom_vnet_name" {
  value = azurerm_virtual_network.ecom_vnet.name
}