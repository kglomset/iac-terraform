resource "azurerm_resource_group" "rg_ecom_platform" {
  name     = local.rg_name
  location = var.location
}

locals {
  workspaces_suffix = terraform.workspace == "default" ? "" : "${terraform.workspace}"

  rg_name           = terraform.workspace == "default" ? "${var.rg_name}" : "${var.rg_name}-${local.workspaces_suffix}"
  sc_name           = terraform.workspace == "default" ? "${var.sc_name}" : "${var.sc_name}-${local.workspaces_suffix}"
  sa_name           = terraform.workspace == "default" ? "${var.sa_name}" : "${var.sa_name}${local.workspaces_suffix}"
  sg_name           = terraform.workspace == "default" ? "${var.sg_name}" : "${var.sg_name}-${local.workspaces_suffix}"
  sb_name           = terraform.workspace == "default" ? "${var.sb_name}" : "${var.sb_name}-${local.workspaces_suffix}"
  vn_name           = terraform.workspace == "default" ? "${var.vn_name}" : "${var.vn_name}-${local.workspaces_suffix}"
  subnet_name       = terraform.workspace == "default" ? "${var.subnet_name}" : "${var.subnet_name}-${local.workspaces_suffix}"
  lb_name           = terraform.workspace == "default" ? "${var.lb_name}" : "${var.lb_name}-${local.workspaces_suffix}"
  ip_name           = terraform.workspace == "default" ? "${var.ip_name}" : "${var.ip_name}-${local.workspaces_suffix}"
  service_plan_name = terraform.workspace == "default" ? "${var.service_plan_name}" : "${var.service_plan_name}-${local.workspaces_suffix}"
  server_name       = terraform.workspace == "default" ? "${var.server_name}" : "${var.server_name}-${local.workspaces_suffix}"
  db_name           = terraform.workspace == "default" ? "${var.db_name}" : "${var.db_name}-${local.workspaces_suffix}"
  vmss_name         = terraform.workspace == "default" ? "${var.vmss_name}" : "${var.vmss_name}-${local.workspaces_suffix}"
}