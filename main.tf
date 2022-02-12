provider "azurerm" {
  features {}
}

terraform {
required_version = ">= 0.13"

}

#br1-rg-dev
#br1-dev-blob-st
locals{
   rg_name = "br1-rg-${var.env}" 
   st_name = "br1${var.env}blobst"
}

resource "azurerm_resource_group" "example" {
  name     = local.rg_name
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
  name                     = local.st_name
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = var.env
  }
}
