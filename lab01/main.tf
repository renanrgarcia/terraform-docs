terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.65.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "rg-storage-tf"
  location = "South Africa North"
}

resource "azurerm_resource_group" "rg_py" {
  name     = "pylab"
  location = "South Africa North"  
}

resource "azurerm_storage_account" "example" {
  name                     = "terraformtf65842"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "tf-state-container" {
  name                  = "tfstate"
  storage_account_id    = azurerm_storage_account.example.id
  container_access_type = "private"
}