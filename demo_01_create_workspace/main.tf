resource "fabric_workspace" "workspace_dev" {
  display_name = var.workspace_name_dev
  capacity_id = var.capacity_id
}

resource "fabric_workspace_role_assignment" "admin_user" {
  workspace_id = fabric_workspace.workspace_dev.id
  principal = {
    id   = var.admin_user_id
    type = "User"
  }
  role = "Admin"
}

resource "fabric_workspace_role_assignment" "developers_group" {
  workspace_id = fabric_workspace.workspace_dev.id
  principal = {
    id   = var.developers_group_id
    type = "Group"
  }
  role = "Member"
}

resource "fabric_lakehouse" "sales" {
  display_name = "sales"
  workspace_id = fabric_workspace.workspace_dev.id
}

locals {
  workspace_id = fabric_workspace.workspace_dev.id
  lakehouse_name = fabric_lakehouse.sales.display_name
  lakehouse_sql_endpoint = fabric_lakehouse.sales.properties.sql_endpoint_properties.connection_string 
  connection_name = "Workspace-[${local.workspace_id}]-Lakehouse[${local.lakehouse_name}]-SqlEndpoint"
}

resource "fabric_connection" "lakehouse_sql_endpoint" {
  display_name      = local.connection_name
  connectivity_type = "ShareableCloud"
  privacy_level     = "Organizational"
  connection_details = {
    type            = "SQL"
    creation_method = "Sql"
    parameters = [
      {
        name  = "server"
        value = local.lakehouse_sql_endpoint
      },
      {
        name  = "database"
        value = local.lakehouse_name
      }
    ]
  }
  credential_details = {
    credential_type       = "ServicePrincipal"
    skip_test_connection  = false
    service_principal_credentials = {
      client_id           = var.client_id
      client_secret_wo    = var.client_secret
      client_secret_wo_version = 1
      tenant_id           = var.tenant_id
    }
  }
}

resource "fabric_connection_role_assignment" "admin_user_perms" {
  connection_id = fabric_connection.lakehouse_sql_endpoint.id
  principal = {
    id   = var.admin_user_id
    type = "User"
  }
  role = "Owner"
}
