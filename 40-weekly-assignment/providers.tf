terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.3.0"

    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-backend-tfstate-kwg"
    storage_account_name = "sabackendkwgzs4qm2ecsg"
    container_name       = "tfstate"
    key                  = "week40.terraform.tfstate"
  }
}

provider "azurerm" {
  subscription_id = "70438f0b-03a6-455f-a559-dd257af223a9"
  features {}
}