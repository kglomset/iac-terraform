output "rg_name" {
  value       = azurerm_resource_group.rg_ecom_platform.name
  description = "Name of the resource group"
}

output "location" {
  value       = azurerm_resource_group.rg_ecom_platform.location
  description = "Location of the resource group"
}

output "local_db_name" {
  value = local.db_name
}

output "local_sa_name" {
  value = local.sa_name
}

output "local_sb_name" {
  value = local.sb_name
}

output "local_server_name" {
  value = local.server_name
}

output "local_lb_name" {
  value = local.lb_name
}

output "local_vn_name" {
  value = local.vn_name
}

output "local_service_plan_name" {
  value = local.service_plan_name
}

output "local_ip_name" {
  value = local.ip_name
}

output "local_vmss_name" {
  value = local.vmss_name
}

output "local_sg_name" {
  value = local.sg_name
}

output "local_subnet_name" {
  value = local.subnet_name
}

output "local_sc_name" {
  value = local.sc_name
}