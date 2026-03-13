variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
}

variable "storage_account_name" {
  description = "Name of the Azure storage account (must be globally unique, lowercase, 3-24 chars)"
  type        = string
  validation {
    condition     = length(var.storage_account_name) >= 3 && length(var.storage_account_name) <= 24 && can(regex("^[a-z0-9]+$", var.storage_account_name))
    error_message = "Storage account name must be 3-24 characters, lowercase letters and numbers only."
  }
}

variable "admin_user_id" {
  description = "Admin User Id"
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

