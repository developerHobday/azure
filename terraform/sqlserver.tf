resource "azurerm_mssql_server" "main" {
  name                         = "${var.project}${var.owner}mssqlserver"
  resource_group_name          = azurerm_resource_group.main.name
  location                     = azurerm_resource_group.main.location
  version                      = "12.0"
  administrator_login          = azurerm_key_vault_secret.db_user.value
  administrator_login_password = azurerm_key_vault_secret.db_password.value
  minimum_tls_version          = "1.2"
  tags = local.common_tags
}

resource "azurerm_mssql_database" "main" {
  name           = "${var.project}${var.owner}mssqldb"
  server_id      = azurerm_mssql_server.main.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 2
  sku_name       = "Basic"

  tags = local.common_tags
}