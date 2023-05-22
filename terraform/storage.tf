resource "azurerm_storage_account" "main" {
  name                     = "${var.project}${var.owner}storageaccount"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = local.common_tags
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