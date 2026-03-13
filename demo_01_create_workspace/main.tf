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
