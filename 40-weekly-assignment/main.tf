module "resource_group" {
  source   = "./modules/resourceGroup"
  rg_name  = local.rg_name
  location = var.location
}

module "storage_account" {
  source  = "./modules/storageAccount"
  sa_name = local.sa_name

  rg_name  = module.resource_group.rg_name
  location = module.resource_group.location


}

module "network" {
  source       = "./modules/network"
  rg_name      = module.resource_group.rg_name
  location     = module.resource_group.location
  sg_name      = var.sg_name
  vn_name      = var.vn_name
  vmss_name    = var.vmss_name
  subnet1_name = var.subnet1_name
}

locals {
  workspaces_suffix = terraform.workspace == "default" ? "" : "${terraform.workspace}"

  rg_name    = terraform.workspace == "default" ? "${var.rg_name}" : "${var.rg_name}-${local.workspaces_suffix}"
  sa_name    = terraform.workspace == "default" ? "${var.sa_name}" : "${var.sa_name}${local.workspaces_suffix}"
  web_suffix = "<h1>${terraform.workspace}</h1>"
}