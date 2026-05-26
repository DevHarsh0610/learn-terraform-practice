variable "storage_account_name" {
  description = "The name of the storage account to create."
  type        = string
}
variable "resource_group_name" {
  description = "The name of the resource group in which to create the storage account."
  type        = string
}
variable "location" {
  description = "The Azure region in which to create the storage account."
  type        = string
}
variable "account_tier" {
  description = "The performance tier of the storage account. Valid values are 'Standard' and 'Premium'."
  type        = string
}
variable "account_replication_type" {
  description = "The replication type of the storage account. Valid values are 'LRS', 'GRS', 'RAGRS', and 'ZRS'."
  type        = string
}
variable "account_kind" {
  description = "The kind of the storage account. Valid values are 'Storage', 'StorageV2', 'BlobStorage', 'FileStorage', and 'BlockBlobStorage'."
  type        = string
}
variable "storage_container_name" {
  description = "The name of the storage container to create within the storage account."
  type        = string
}
variable "container_access_type" {
  description = "The access level of the storage container. Valid values are 'private', 'blob', and 'container'."
  type        = string
}