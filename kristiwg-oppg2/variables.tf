variable "rg_name" {
  type        = string
  description = "The name of the resource group"
}

variable "location" {
  type        = string
  description = "The geographical location of the infrastructure"
}

variable "sg_name" {
  type        = string
  description = "Name of the security group"
}

variable "ip_name" {
  type        = string
  description = "Name of the public IP for load balancer"
}

variable "lb_name" {
  type        = string
  description = "Name of the load balancer"
}

variable "vn_name" {
  type        = string
  description = "Name of the vritual network"
}

variable "subnet_name" {
  type        = string
  description = "Name of the subnet"
}

variable "sb_name" {
  type        = string
  description = "Name of the storage blob"
}

variable "sa_name" {
  type        = string
  description = "Name of the storage account"
}

variable "service_plan_name" {
  type        = string
  description = "Name of the application service plan"
}

variable "db_name" {
  type        = string
  description = "Name of the application SQL database"
}

variable "vmss_name" {
  type        = string
  description = "Name of the virtual machine scale set"
}

variable "server_name" {
  type        = string
  description = "Name of the server hosting the application database"
}

variable "sc_name" {
  type = string
  description = "Name of the storage container"
}

variable "server_admin_pwd" {
  type = string
  description = "The passsword of the SQL server admin user"
}

variable "server_admin_username" {
  type = string
  description = "The admin username for the SQL server"
}

variable "vmss_admin_password" {
  type = string
  description = "The password for the VMSS admin user"
}

variable "vmss_admin_username" {
  type = string
  description = "The admin username for the VMSS"
}

variable "vmss_sku" {
  type = string
  description = "The type of sku for the VMSS"
}

variable "vmss_nic" {
  type = string
  description = "Name of the NIC"
}

variable "vmss_nic_ip_config" {
  type = string
  description = "Name of the IP configuration"
}
