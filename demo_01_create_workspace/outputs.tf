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

output "lakehouse_name" {
  description = "Id of lakehouse"
  value = fabric_lakehouse.sales.display_name
}
output "lakehouse_sql_endpoint_server" {
  description = "SQL endpoint connect string for lakehouse"
  value = fabric_lakehouse.sales.properties.sql_endpoint_properties.connection_string
}

output "lakehouse_sql_endpoint_database" {
  description = "SQL endpoint id for lakehouse"
  value = fabric_lakehouse.sales.display_name
}

output "sql_endpoint_connection_id" {
  description = "SQL endpoint id for lakehouse"
  value = fabric_connection.lakehouse_sql_endpoint.id
}