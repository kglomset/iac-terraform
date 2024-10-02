variable "rg_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "The location region of the resource group"
}

variable "sa_name" {
  type        = string
  description = "Name of the storage account"
}

variable "index_document" {
  type        = string
  description = "Name of the index document"
}

variable "source_content" {
  type        = string
  description = "Source content for the index.html file"
}

