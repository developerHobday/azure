output "resource_group_name" {
  value = azurerm_resource_group.main.name
}

output "sas_url_query_string" {
  value = data.azurerm_storage_account_sas.main.sas
  sensitive = true
}