resource "azurerm_data_factory" "main" {
  name                = "${var.project}${var.owner}datafactory"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  identity {
    type = "SystemAssigned"    
  }

  github_configuration {
    account_name    = "developerHobday"
    branch_name     = "adf"
    git_url = "https://github.com"
    repository_name = "azure"
    root_folder     = "/adf/"
  }
}
