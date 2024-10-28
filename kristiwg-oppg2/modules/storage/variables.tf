variable "rg_name" {
  type        = string
  description = "The name of the resource group"
}

variable "sa_name" {
  type        = string
  description = "Name of the storage account"
}

variable "location" {
  type        = string
  description = "The geographical location of the infrastructure"
}

variable "sc_name" {
  type        = string
  description = "Name of the storage container"
}

variable "sb_name" {
  type        = string
  description = "Name of the storage blob"
}