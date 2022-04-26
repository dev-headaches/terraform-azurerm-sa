terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.12"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 2.3.0"
    }
  }
}


resource "azurerm_storage_account" "storage_account" {
  name                     = "sancldsazfwtst"
  resource_group_name      = var.rgname
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  enable_https_traffic_only = true
  allow_blob_public_access = false
  blob_properties = {
      versioning_enabled = false  
    }
    tags = {
    environment = var.enviro
  }
}
resource "azurerm_storage_container" "default_blob" {
  count = var.blob ? 1:0
  name                  = "blobcontainer"
  storage_account_name  = azurerm_storage_account.storage_account
  container_access_type = "private"
}

resource "azurerm_private_endpoint" "pe_blob" {
  count = var.pe ? 1:0
  name                = "blob-pe"
  location            = var.location
  resource_group_name = var.rgname
  subnet_id           = var.pesubnetid

  private_service_connection {
    name                           = "blobcontainer-pe-connection"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_storage_account.sanbeamazfwtst.id
    subresource_names              = ["blob"]
  }
