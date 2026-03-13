output "azure_capacity_id" {
  description = "Capacity id of Azure resouce"
  value       = azurerm_fabric_capacity.main.id
}

# output "fabric_capacity_id" {
#   description = "Capacity id in Fabric"
#   value       = data.fabric_capacity.main.id
# }

output "capacity_admins" {
  description = "Admins for capacity"
  value       = azurerm_fabric_capacity.main.administration_members
}

output "capacity_location" {
  description = "Azure location ofr capacity"
  value       = azurerm_fabric_capacity.main.location
}

output "capacity_sku_size" {
  description = "Capacity_sku_size"
  value       = azurerm_fabric_capacity.main.sku
}