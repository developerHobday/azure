resource "azurerm_storage_account" "main" {
  name                     = "${var.project}${var.owner}storageaccount"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  is_hns_enabled = true

  tags = local.common_tags
}

resource "azurerm_storage_data_lake_gen2_filesystem" "main" {
  name               = "${var.project}${var.owner}filesystem"
  storage_account_id = azurerm_storage_account.main.id
}

resource "azurerm_storage_container" "sc_input" {
  name                  = "input"
  storage_account_name  = azurerm_storage_account.main.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "sc_staging" {
  name                  = "staging"
  storage_account_name  = azurerm_storage_account.main.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "sc_rejected" {
  name                  = "rejected"
  storage_account_name  = azurerm_storage_account.main.name
  container_access_type = "private"
}

data "azurerm_storage_account_sas" "main" {
  connection_string = azurerm_storage_account.main.primary_connection_string
  signed_version    = "2019-10-10"

  resource_types {
    service   = true
    container = true
    object    = true
  }

  services {
    blob  = true
    queue = false
    table = false
    file  = true
  }

  start = timestamp()
  expiry = timeadd(timestamp(), "240h")

  permissions {
    read    = true
    write   = true
    delete  = true
    list    = true
    add     = true
    create  = true
    update  = false
    process = false
    tag     = true
    filter  = true
  }
}

