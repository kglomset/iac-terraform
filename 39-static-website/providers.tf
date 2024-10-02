terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.3.0"

    }
  }
   backend "azurerm" {
    resource_group_name  = "rg-backend-tfstate-kwg"
    storage_account_name = "sabackendkwgk0p7au0zvx"
    container_name       = "scbackendtfstate"
    key                  = "prod.terraform.tfstate"
  }
}

provider "azurerm" {
  //subscription_id = "70438f0b-03a6-455f-a559-dd257af223a9"
  features {}
}