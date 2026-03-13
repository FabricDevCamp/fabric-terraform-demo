variable "workspace_name_dev" {
  description = "Name of the Fabric workspace to create"
  type        = string
  nullable    = false
}

variable "capacity_id" {
  description = "Id of the Fabric capacity assigned to the workspace"
  type        = string
  nullable    = false
}

variable "admin_user_id" {
  description = "Id of user to be added as workspace admin"
  type        = string
}

variable "developers_group_id" {
  description = "Id of Entra Id group to be added as workspace members"
  type        = string
}

variable "tenant_id" {
  description = "Fabric Tenant Id"
  type        = string
}

variable "client_id" {
  description = "Fabric Client Id"
  type        = string
}
variable "client_secret" {
  description = "Fabric Client Secret"
  type        = string
  sensitive   = true
}
