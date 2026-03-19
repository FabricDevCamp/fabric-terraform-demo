resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "main" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "sales_data" {
  storage_account_id = azurerm_storage_account.main.id
  name                  = "sales-data"
  container_access_type = "private"
}

data "azurerm_storage_account_blob_container_sas" "sales_data_sas" {
  connection_string = azurerm_storage_account.main.primary_connection_string
  container_name    = azurerm_storage_container.sales_data.name
  https_only        = true

  start  = timestamp()
  expiry = timeadd(timestamp(), "8760h") # 8760 hours = 1 year duration

  permissions {
    read   = true
    list = true
    add    = false
    create = false
    write  = false
    delete = false
  }
}

locals {
  adls_server = azurerm_storage_account.main.primary_dfs_endpoint
  adls_container = data.azurerm_storage_account_blob_container_sas.sales_data_sas.container_name
  adls_target_path = "${local.adls_server}${local.adls_container}"
}

resource "fabric_connection" "alds_sas" {
  display_name      = "ADLS-SAS-[${local.adls_target_path}]"
  connectivity_type = "ShareableCloud"
  privacy_level     = "Organizational"
  connection_details = {
    type            = "AzureDataLakeStorage"
    creation_method = "AzureDataLakeStorage"
    parameters = [
      {
        name  = "server"
        value = local.adls_server
      },
      {
        name  = "path"
        value = local.adls_container
      }
    ]
  }
  credential_details = {
    credential_type       = "SharedAccessSignature"
    skip_test_connection  = false
    shared_access_signature_credentials = {
      token_wo           = data.azurerm_storage_account_blob_container_sas.sales_data_sas.sas
      token_wo_version   = 1
    }
  }
}

resource "fabric_connection_role_assignment" "admin_user_adls_sas" {
  connection_id = fabric_connection.alds_sas.id
  principal = {
    id   = var.admin_user_id
    type = "User"
  }
  role = "Owner"
}
