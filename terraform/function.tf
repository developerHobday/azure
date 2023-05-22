resource "azurerm_service_plan" "main" {
  name                = "${var.project}${var.owner}serviceplan"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  os_type             = "Linux"
  sku_name            = "Y1" # TODO configure the appropriate type 
  tags = local.common_tags
}

resource "azurerm_linux_function_app" "main" {
  name                = "${var.project}${var.owner}-function-app"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  storage_account_name       = azurerm_storage_account.main.name
  storage_account_access_key = azurerm_storage_account.main.primary_access_key
  service_plan_id            = azurerm_service_plan.main.id
  tags = local.common_tags

  site_config {}
}