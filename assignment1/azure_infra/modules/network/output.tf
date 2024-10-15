output "subnet_1_id" {
  value       = azurerm_subnet.subnet1.id
  description = "ID of subnet 1"
}

output "subnet_2_id" {
  value       = azurerm_subnet.subnet2.id
  description = "ID of subnet 2"
}

output "vnetname" {
  value = azurerm_virtual_network.vnet.name
  description = "Name of the virtual network"  
}