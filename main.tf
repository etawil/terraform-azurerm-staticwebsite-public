resource "random_string" "myrandom" {
  length = 6
  special = false
  numeric = false
  upper = false
}

resource "azurerm_resource_group" "Prod-Deployment-RG" {
  name = "${var.resource_group_name}${random_string.myrandom.id}"
  location = var.location
}

resource "azurerm_storage_account" "deplmtstg" {
  name                     = "${var.storage_account_name}${random_string.myrandom.id}"
  resource_group_name      = azurerm_resource_group.Prod-Deployment-RG.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_account_static_website" "staticwebsite" {
  storage_account_id = azurerm_storage_account.deplmtstg.id
  error_404_document = "error.html"
  index_document     = "index.html"
}