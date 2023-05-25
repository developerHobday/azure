resource "azurerm_key_vault" "main" {
  name                     = "${var.project}${var.owner}keyvault"
  resource_group_name      = azurerm_resource_group.main.name
  location      = azurerm_resource_group.main.location
  sku_name = "standard"
  tenant_id                   = var.ARM_TENANT_ID
  enable_rbac_authorization = true
  tags = local.common_tags
}

resource "azurerm_key_vault_secret" "db_user" {
  name         = "db-user"
  value = var.DB_USER
  key_vault_id = azurerm_key_vault.main.id
  tags = local.common_tags
}

resource "azurerm_key_vault_secret" "db_password" {
  name         = "db-password"
  value = var.DB_PASSWORD
  key_vault_id = azurerm_key_vault.main.id
  tags = local.common_tags
}

resource "azurerm_key_vault_secret" "storage_sas" {
  name         = "storage-sas"
  value = data.azurerm_storage_account_sas.main.sas
  key_vault_id = azurerm_key_vault.main.id
  tags = local.common_tags
}
resource "azurerm_key_vault_secret" "databricks_token" {
  name         = "databricks-access-token"
  value = var.DATABRICKS_ACCESS_TOKEN
  key_vault_id = azurerm_key_vault.main.id
  tags = local.common_tags
}

