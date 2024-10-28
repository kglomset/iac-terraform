variable "rg_name" {
  type        = string
  description = "The name of the resource group"
}

variable "location" {
  type        = string
  description = "The geographical location of the infrastructure"
}

variable "service_plan_name" {
  type        = string
  description = "Name of the service plan"
}