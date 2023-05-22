resource "azurerm_data_factory" "main" {
  name                = "${var.project}${var.owner}datafactory"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_data_factory_pipeline" "main" {
  name            = "${var.project}${var.owner}pipeline"
  data_factory_id = azurerm_data_factory.main.id
}