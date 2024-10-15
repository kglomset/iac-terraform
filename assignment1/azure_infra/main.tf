terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.1.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "70438f0b-03a6-455f-a559-dd257af223a9"
  features {
  }
}

module "resourceGroup" {
  source   = "./modules/resourceGroup"
  rgname   = var.rgname
  location = var.location
}

module "storageAccount" {
  source                 = "./modules/storageAccount"
  rgname                 = module.resourceGroup.rgname
  sa_name                = var.sa_name
  location               = module.resourceGroup.location
  storage_container_name = var.storage_container_name
  sa-access-key          = module.storageAccount.sa_access_key

}

module "network" {
  source      = "./modules/network"
  rgname      = module.resourceGroup.rgname
  location    = module.resourceGroup.location
  vnetname    = var.vnetname
  nsgname     = var.nsgname
  subnetname1 = var.subnetname1
  subnetname2 = var.subnetname2
}

module "keyVault" {
  source        = "./modules/keyVault"
  sa_name     = module.storageAccount.storage_account_name
  keyvaultname  = var.keyvaultname
  rgname        = module.resourceGroup.rgname
  location      = module.resourceGroup.location
  sa-access-key = module.storageAccount.sa_access_key
  username      = var.admin_username
  password      = var.admin_password

}

module "vm" {
  source      = "./modules/vm"
  rgname      = module.resourceGroup.rgname
  vmssname    = var.vmssname
  username    = module.keyVault.vm_username_secret
  password    = module.keyVault.vm_password_secret
  subnet_1_id = module.network.subnet_1_id
}
