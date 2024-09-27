variable "rg_backend_name" {
  type        = string
  description = "Backend storage account name"
}

variable "location_backend" {
  type        = string
  description = "Backend location"
}

variable "sa_backend_name" {
  type        = string
  description = "Backend storage account name"
}

variable "sc_backend_name" {
  type        = string
  description = "Backend storage container name"
}

variable "kv_backend_name" {
  type        = string
  description = "Name of the backen key vault"
}

variable "sa_backend_accesskey_name" {
  type        = string
  description = "Name of the storage account backend access key"
}