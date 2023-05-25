# resource "azurerm_mssql_server" "main" {
#   name                         = "${var.project}${var.owner}mssqlserver"
#   resource_group_name          = azurerm_resource_group.main.name
#   location                     = azurerm_resource_group.main.location
#   version                      = "12.0"
#   administrator_login          = azurerm_key_vault_secret.db_user.value
#   administrator_login_password = azurerm_key_vault_secret.db_password.value
#   minimum_tls_version          = "1.2"
#   tags = local.common_tags

#   }
# # TODO allow azure services to access

# # Create SQL Server firewall rule for Azure resouces access
# # https://stackoverflow.com/questions/64690173/terraform-azure-server-access-issue
# resource "azurerm_mssql_firewall_rule" "azureservicefirewall" {
#   name                = "allow-azure-service"
#   server_id      = azurerm_mssql_server.main.id
#   start_ip_address    = "0.0.0.0"
#   end_ip_address      = "0.0.0.0"
# }

# resource "azurerm_mssql_database" "main" {
#   name           = "${var.project}${var.owner}mssqldb"
#   server_id      = azurerm_mssql_server.main.id
#   collation      = "SQL_Latin1_General_CP1_CI_AS"
#   # license_type   = "LicenseIncluded"
#   max_size_gb    = 2
#   sku_name       = "GP_S_Gen5_1"
#   auto_pause_delay_in_minutes = 60
#   min_capacity                = 0.5
#   read_replica_count          = 0
#   read_scale                  = false
#   zone_redundant              = false

#   tags = local.common_tags
#   # TODO use serverless https://stackoverflow.com/questions/63849208/how-to-create-new-database-in-the-serverless-compute-tier-in-azure-sql-through-t
# }