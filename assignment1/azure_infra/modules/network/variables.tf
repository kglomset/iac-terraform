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

variable "rgname" {
  type        = string
  description = "The name of the resource group"
}


variable "location" {
  type        = string
  description = "Location of the resource group"
  default     = "westeurope"
}