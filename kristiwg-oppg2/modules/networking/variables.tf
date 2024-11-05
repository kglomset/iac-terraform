variable "sg_name" {
  type        = string
  description = "Name of the security group"
}

variable "rg_name" {
  type        = string
  description = "The name of the resource group"
}

variable "location" {
  type        = string
  description = "The geographical location of the infrastructure"
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