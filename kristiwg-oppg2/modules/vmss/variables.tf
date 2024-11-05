variable "vmss_admin_password" {
  type        = string
  description = "Password to the VMSS admin user"
}

variable "vmss_admin_username" {
  type        = string
  description = "Username to the VMSS admin user"
}

variable "vmss_name" {
  type        = string
  description = "Name of the VMSS"
}

variable "vmss_sku" {
  type        = string
  description = "The type of VMSS size and specs"
}


variable "rg_name" {
  type        = string
  description = "The name of the resource group"
}

variable "location" {
  type        = string
  description = "The geographical location of the infrastructure"
}

variable "vmss_nic" {
  type        = string
  description = "Name of the network interface"
}

variable "subnet_id" {
  type = string
  description = "The ID of the subnet used by the VMSS"
}

variable "vmss_nic_ip_config" {
  type = string
  description = "Name of the NIC IP configuration for the VMSS"
}