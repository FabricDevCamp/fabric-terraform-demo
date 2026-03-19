variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
}

variable "capacity_location" {
  description = "Azure region for resources"
  type        = string
}

variable "capacity_name" {
  description = "Name of Fabric capacity"
  type        = string
}

variable "capacity_sku_size" {
  description = "Size of Fabric capacity"
  type        = string
}

variable "workspace_name" {
  description = "Wokspace created and associated with capacity"
  type        = string
}
variable "admin_user_upn" {
  description = "UPN of user to be added as capacity admin"
  type        = string
}

variable "admin_user_id" {
  description = "User that will be added as admin on created resouces"
  type        = string
}

variable "tenant_id" {
  description = "Tenant Id"
  type        = string
}

variable "client_id" {
  description = "Client Id"
  type        = string
}
variable "client_secret" {
  description = "Client Secret"
  type        = string
  sensitive   = true
}

variable "subscription_id" {
  description = "Azure Subscription Id"
  type        = string
}
