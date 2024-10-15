variable "location" {
  type        = string
  description = "(optional) describe your variable"
  default     = "West Europe"
}

variable "rgname" {
  type        = string
  description = "Resource Group Name"
  default     = "rg-week-35"
}

variable "sa1name" {
  type        = string
  description = "Storage Account 1 Name"
}

variable "sa2name" {
  type        = string
  description = "Storage Account 2 Name"
}

variable "sa3name" {
  type        = string
  description = "Storage Account 3 Name"
}

variable "sg1name" {
  type        = string
  description = "Security Group 1 Name"
}

variable "sg2name" {
  type        = string
  description = "Security Group 1 Name"
}

variable "vn1name" {
  type        = string
  description = "Virtual Network 1 Name"
}

variable "vn2name" {
  type        = string
  description = "Virtual Network 2 Name"
}

variable "snname1" {
  type        = string
  description = "Subnet 1 Name"
}

variable "snname2" {
  type        = string
  description = "Subnet 2 Name"
}

variable "snname3" {
  type        = string
  description = "Subnet 1 Name"
}

variable "snname4" {
  type        = string
  description = "Subnet 2 Name"
}

variable "company" {
  type        = string
  description = "Company Name"
}

variable "project" {
  type        = string
  description = "Project Name"
}

variable "billingDepartment" {
  type        = string
  description = "Billing Department"
}

variable "owner" {
  type        = string
  description = "Owner"
}

variable "az-regions" {
    type = list(string)
    description = "Azure regions for resources"
    default = [ "northeurope", "westeurope" ]
}

variable "vmsize" {
    type = map
    default = {
        "small" = "Standard_B1s"
        "medium" = "Standard_B2s"
        "large" = "Standard_B4s"
    }
}