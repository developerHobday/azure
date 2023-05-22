az account set --subscription "3660cb90-078d-47b8-992b-f74c84f3c386"

A service principal is created with the role User Access Administrator

az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/3660cb90-078d-47b8-992b-f74c84f3c386"

https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles

az role assignment create --assignee 1e16fddb-e360-4657-8f45-e24834eed6ac \
--role "User Access Administrator" \
--scope "/subscriptions/3660cb90-078d-47b8-992b-f74c84f3c386"

az role assignment create --assignee 1e16fddb-e360-4657-8f45-e24834eed6ac \
--role "Key Vault Administrator" \
--scope "/subscriptions/3660cb90-078d-47b8-992b-f74c84f3c386"

https://learn.microsoft.com/en-us/azure/role-based-access-control/role-assignments-portal