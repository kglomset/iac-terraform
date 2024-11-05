variable "rg_name" {
  type        = string
  description = "The name of the resource group"
}

variable "location" {
  type        = string
  description = "The geographical location of the infrastructure"
}

variable "server_name" {
  type        = string
  description = "Name of the MySQL server"
}

variable "db_name" {
  type        = string
  description = "Name of the database"
}

variable "server_admin_username" {
  type        = string
  description = "Administrator login username for MySQL server"
}

variable "server_admin_pwd" {
  type        = string
  description = "Administrator login password for MySQL server"
}

variable "storage_endpoint" {
  type = string
  description = "Endpoint of storage blob"
}

variable "sa_prim_access_key" {
  type = string
  description = "Primary access key of the storage account"
}