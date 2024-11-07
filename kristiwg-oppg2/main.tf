terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-backend-tfstate-kwg"
    storage_account_name = "sabackendkwgxj8te6ry5p"
    container_name       = "tfstate"
    key                  = "assignment2.terraform.tfstate"
  }
}

provider "azurerm" {
  subscription_id = "70438f0b-03a6-455f-a559-dd257af223a9"
  features {
  }
}

module "global" {
    source = "../global"
  rg_name           = var.rg_name
  sa_name           = var.sa_name
  sg_name           = var.sg_name
  sb_name           = var.sb_name
  vn_name           = var.vn_name
  subnet_name       = var.subnet_name
  lb_name           = var.lb_name
  ip_name        = var.ip_name
  service_plan_name = var.service_plan_name
  server_name       = var.server_name
  db_name           = var.db_name
  vmss_name         = var.vmss_name
  sc_name = var.sc_name
  location = var.location
}

module "networking" {
  source      = "../modules/networking"
  rg_name     = module.global.rg_name
  sg_name     = module.global.local_sg_name
  ip_name  = module.global.local_ip_name
  lb_name     = module.global.local_lb_name
  location    = module.global.location
  vn_name     = module.global.local_vn_name
  subnet_name = module.global.local_subnet_name
}

module "app_service" {
  source = "../modules/app_service"
  service_plan_name = module.global.local_service_plan_name
  rg_name = module.global.rg_name
  location = module.global.location
}

module "database" {
  source = "../modules/database"
  location = module.global.location
  db_name = module.global.local_db_name
  rg_name = module.global.rg_name
  server_name = module.global.local_server_name
  server_admin_pwd = var.server_admin_pwd
  server_admin_username = var.server_admin_username
  storage_endpoint = module.storage.storage_endpoint
  sa_prim_access_key = module.storage.sa_primary_access_key
}

module "storage" {
  source = "../modules/storage"
  sa_name = module.global.local_sa_name
  sc_name = module.global.local_sc_name
  sb_name = var.sb_name
  location = module.global.location
  rg_name = module.global.rg_name
}

module "vmss" {
  source = "../modules/vmss"
  rg_name     = module.global.rg_name
  location    = module.global.location
  vmss_admin_password = var.vmss_admin_password
  vmss_admin_username = var.vmss_admin_username
  vmss_name = module.global.local_vmss_name
  vmss_sku = var.vmss_sku
  vmss_nic = var.vmss_nic
  vmss_nic_ip_config = var.vmss_nic_ip_config
  subnet_id = module.networking.ecom_snet_id
}
