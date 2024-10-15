variable "rgname" {
  type        = string
  description = "The name of the resource group"
}

variable "location" {
  type        = string
  description = "The Azure region where resources will be created"
}

variable "keyvaultname" {
  type        = string
  description = "The name of the key vault"
}

variable "sa-access-key" {
  type        = string
  description = "The storage account access key"
}

variable "password" {
  type        = string
  description = "Admin password stored in Key Vault"
  sensitive   = true
}

variable "username" {
  type        = string
  description = "Admin username stored in Key Vault"
  sensitive   = true
}

variable "sa_name" {
  type        = string
  description = "The name of the storage account"
}