variable "sa_name" {
  type        = string
  description = "The name of the storage account"
}

variable "rgname" {
  type        = string
  description = "The name of the resource group"
}

variable "location" {
  type        = string
  description = "The Azure region where resources will be created"
}

variable "storage_container_name" {
  type        = string
  description = "Name of the storage account container"
  default     = "sa-container-oblig1"
}

variable "sgtype" {
  type        = string
  description = "The storage account type"
  default     = "Standard_LRS"
}

variable "sa-access-key" {
  type        = string
  description = "(optional) describe your variable"
}