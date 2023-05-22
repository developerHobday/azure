resource "azurerm_data_factory" "main" {
  name                = "${var.project}${var.owner}datafactory"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  # github_configuration {
  #   account_name    = "developerHobday"
  #   branch_name     = "adf"
  #   git_url = "https://github.com"
  #   repository_name = "iot"
  #   root_folder     = "/adf/"
  # }
}

resource "azurerm_data_factory_pipeline" "main" {
  name            = "${var.project}${var.owner}pipeline"
  data_factory_id = azurerm_data_factory.main.id
}

# data "azurerm_client_config" "current" {
# }

resource "azurerm_data_factory_linked_service_data_lake_storage_gen2" "main" {
  name                  = "${var.project}${var.owner}datalakelinkedservice"
  data_factory_id       = azurerm_data_factory.main.id
  # connection_string    = azurerm_storage_account.example.connection_string
  use_managed_identity = true
  # service_principal_id  = var.ARM_CLIENT_ID
  # service_principal_key = var.ARM_CLIENT_SECRET
  # tenant                = var.ARM_TENANT_ID
  url                   = azurerm_storage_account.main.primary_blob_endpoint
  # annotations = local.common_tags
}

# resource "azurerm_data_factory_dataset_json" "main" {
#   name                = "${var.project}${var.owner}datalakedataset"
#   data_factory_id     = azurerm_data_factory.main.id
#   linked_service_name = azurerm_data_factory_linked_service_data_lake_storage_gen2.main.name
#   folder = "input"
#   encoding = "UTF-8"
#   # azure_blob_storage_location {
#   #   container = "/input"
#   #   filename                 = ""
#   #   path                     = ""
#   #   dynamic_filename_enabled = true
#   #   dynamic_path_enabled     = true
#   # }
# }