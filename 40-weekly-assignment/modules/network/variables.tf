variable "rg_name" {
    type = string
    description = "Resource group name"
}

variable "location" {
    type = string
    description = "Location of the resource group"
}

variable "sg_name" {
    type = string
    description = "Name of the security group"
}

variable "vn_name" {
    type = string
    description = "Name of the virtual network"
}

variable "vmss_name" {
    type = string
    description = "Name of the virtual machine scale set"
}

variable "subnet1_name" {
    type = string
    description = "Name of subnet 1"
}