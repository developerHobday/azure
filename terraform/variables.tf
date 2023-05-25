variable "project" {
  type = string
}
variable "owner" {
  type = string
}

# authentication
variable "ARM_CLIENT_ID" {
  type        = string
  description = "service principal appid"
  sensitive   = true
}
variable "ARM_CLIENT_SECRET" {
  type        = string
  description = "service principal password"
  sensitive   = true
}
variable "ARM_SUBSCRIPTION_ID" {
  type        = string
  description = "azure subscription id"
  sensitive   = true
}
variable "ARM_TENANT_ID" {
  type        = string
  description = "azure subscription tenant id"
  sensitive   = true
}

variable "DB_USER" {
  type        = string
  sensitive   = true
}
variable "DB_PASSWORD" {
  type        = string
  sensitive   = true
}
variable "DATABRICKS_ACCESS_TOKEN" {
  type        = string
  sensitive   = true
}