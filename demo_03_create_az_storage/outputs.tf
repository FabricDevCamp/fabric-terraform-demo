output "storage_account_id" {
  description = "The ID of the storage account"
  value       = azurerm_storage_account.main.id
}

output "storage_account_name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.main.name
}

output "storage_account_primary_dfs_endpoint" {
  description = "The primary blob endpoint of the storage account"
  value       = azurerm_storage_account.main.primary_dfs_endpoint
}

output "container_name" {
  description = "The name of the storage container"
  value       = azurerm_storage_container.sales_data.name
}

output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.main.name
}
output "sas_token" {
  description = "SAS token for accessing the storage container"
  value       = data.azurerm_storage_account_blob_container_sas.sales_data_sas.sas
  sensitive   = true
}

output "container_sas_url" {
  description = "Full SAS URL for accessing the storage container"
  value       = "${azurerm_storage_account.main.primary_blob_endpoint}${azurerm_storage_container.sales_data.name}?${data.azurerm_storage_account_blob_container_sas.sales_data_sas.sas}"
  sensitive   = true
}