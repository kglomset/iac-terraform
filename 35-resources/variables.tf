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

variable "saname" {
  type        = string
  description = "Storage Account Name"
}
variable "sgname" {
  type        = string
  description = "Security Group Name"
}

variable "vnname" {
  type        = string
  description = "Virtual Network Name"
}

variable "snname1" {
    type = string
    description = "Subnet 1 Name"
}

variable "snname2" {
    type = string
    description = "Subnet 2 Name"
}