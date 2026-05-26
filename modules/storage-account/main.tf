resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  account_kind             = var.account_kind

  tags = {
    environment = "learning"
  }
}
resource "azurerm_storage_container" "storage_container" {
  name                  = var.storage_container_name
  storage_account_id    = azurerm_storage_account.storage_account.id
  container_access_type = var.container_access_type
}
resource "azurerm_storage_blob" "storage_blob" {
  name                   = "example-blob.txt"
  storage_account_name   = azurerm_storage_account.storage_account.name
  storage_container_name = azurerm_storage_container.storage_container.name
  type                   = "Block"
  source_content         = "Hello there from Terraform!"
}
