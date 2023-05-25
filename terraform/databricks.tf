resource "azurerm_databricks_workspace" "main" {
  name                = "${var.project}${var.owner}-databricks-workspace"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  sku                 = "trial"

  tags = local.common_tags
}