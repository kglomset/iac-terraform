variable "rg_name" {
  type        = string
  description = "Name of the resource group"
  default = "rg-web-kwg"
}

variable "location" {
  type        = string
  description = "The location region of the resource group"
  default = "westeurope"
}

variable "sa_name" {
  type        = string
  description = "Name of the storage account"
  default = "sawebkwg"
}

variable "index_document" {
  type        = string
  description = "Name of the index document"
  default = "index.html"
}

variable "source_content" {
  type        = string
  description = "Source content for the index.html file"
  default = "<h1> Web page created with terraform</h1>"
}

