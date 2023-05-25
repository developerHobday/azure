
## Prerequisites
An Azure subscription. 
Terraform 0.14.9 or later
The Azure CLI Tool installed


## IAM
Access control can be set under the IAM page in the resource group.



## Refresh
services do not appear in dashboard after creation, need to search manually
linked services do not appear after creation in git mode - workaround, use live mode for now


## Tainted objects
Can happen if terraform does not create them fully

https://discuss.hashicorp.com/t/bucket-tainted-so-must-be-replaced/49604/2
https://jeffbrown.tech/terraform-taint-replace/

## az cli

az datafactory dataset list --factory-name adf-colin-11 --resource-group default

az datafactory dataset show --name "Datasets_ListByFactory" --factory-name "iot12colindatafactory" --resource-group "iot12colinresourcegroup"

## import 
terraform import azurerm_data_factory_dataset_json.main "/subscriptions/3660cb90-078d-47b8-992b-f74c84f3c386/resourceGroups/default/providers/Microsoft.DataFactory/factories/adf-colin-11/datasets/iot_valid_ds"

"/subscriptions/3660cb90-078d-47b8-992b-f74c84f3c386/resourceGroups/default/providers/Microsoft.DataFactory/factories/adf-colin-11/datasets/iot_sql_server"

Terraform not very good to work with data factory,
e.g. when creating azurerm_data_factory_dataset_json, it insists that the location must not be an empty string.

# data factory
input needs to select the exact json to work
idempotent - pipeline can run multiple times
can test / debug before publish
source is saved to git on save, and can resync from git to load



# sas token 
For error when trying to access (read) storage 
Server failed to authenticate the request. Make sure the value of Authorization header is formed correctly including the signature.

Ensure the signed version in azurerm_storage_account_sas is supported.  See
https://github.com/hashicorp/terraform-provider-azurerm/issues/18007

# Databricks

Create a secrets scope
> databricks secrets create-scope --scope <scope-name>

How to assign AzureDatabricks as a secrets reader to key vault
https://learn.microsoft.com/en-us/azure/databricks/security/secrets/secret-scopes
Follow Azure Key Vault-backed scopes
https://github.com/MicrosoftDocs/azure-docs/issues/105196