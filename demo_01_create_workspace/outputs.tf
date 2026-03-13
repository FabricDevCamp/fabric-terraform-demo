output "dev_workspace_id" {
  description = "Id of Fabric workspace"
  value       = fabric_workspace.workspace_dev.id
}

output "dev_workspace_name" {
  description = "Display name of Fabric workspace"
  value       = fabric_workspace.workspace_dev.display_name
}

output "lakehouse_id" {
  description = "Id of lakehouse"
  value = fabric_lakehouse.sales.id
}

output "lakehouse_sql_connect_string" {
  description = "SQL endpoint connect string for lakehouse"
  value = fabric_lakehouse.sales.properties.sql_endpoint_properties.connection_string
}

output "lakehouse_sql_endpoint_id" {
  description = "SQL endpoint id for lakehouse"
  value = fabric_lakehouse.sales.properties.sql_endpoint_properties.id
}