variable "vmssname" {
  type        = string
  description = "Name of the virtual machine"
  default     = "vmss-oblig-1"
}

variable "rgname" {
  type        = string
  description = "The name of the resource group"
}

variable "location" {
  type        = string
  description = "Location of the resource group"
  default     = "westeurope"
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet"
  default     = ""
}

variable "subnet_1_id" {
  type        = string
  description = "ID of subnet 1"
}

variable "password" {
  type        = string
  description = "The password to store in the key vault"
  sensitive   = true
}

variable "username" {
  type        = string
  description = "The username to store in the key vault"
  sensitive   = true
}