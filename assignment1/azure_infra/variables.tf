variable "rgname" {
  type        = string
  description = "Name of the resource group"
  default     = "assignment-1-rg"
}

variable "location" {
  type        = string
  description = "Location/region of the resource group"
  default     = "westeurope"
}

variable "nsgname" {
  type        = string
  description = "The name of the network security group"
  default     = "nsg-assignment-1"
}

variable "vnetname" {
  type        = string
  description = "The name of the virtual network"
  default     = "vnet-assignment-1"
}

variable "subnetname1" {
  type        = string
  description = "Name of subnet 1"
  default     = "sn1-oblig1"
}

variable "subnetname2" {
  type        = string
  description = "Name of subnet 2"
  default     = "sn2-oblig1"
}

variable "sa_name" {
  type        = string
  description = "The name of the storage account"
}

variable "vmssname" {
  type        = string
  description = "Name of the virtual machine"
  default     = "vmss-oblig-1"
}

variable "admin_username" {
  type        = string
  description = "Username for admin user"
  sensitive   = true
}

variable "admin_password" {
  type        = string
  description = "Password for the admin user"
  sensitive   = true
}

variable "storage_container_name" {
  type        = string
  description = "Name of the storage account container"
  default     = "sa-container-oblig1"
}

variable "keyvaultname" {
  type        = string
  description = "The name of the key vault"
}