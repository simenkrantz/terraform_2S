terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }

  required_version = ">= 0.14.9"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet_1" {
  name                = var.vnet_1_name
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.vnet_1_address_space
  location            = var.location
}

resource "azurerm_virtual_network" "vnet_2" {
  name                = var.vnet_2_name
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.vnet_2_address_space
  location            = var.location
}

resource "azurerm_virtual_network_peering" "vnet_peering_1" {
  name                      = var.vnet_peering_1_name
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.vnet_1.name
  remote_virtual_network_id = azurerm_virtual_network.vnet_2.id
}

resource "azurerm_virtual_network_peering" "vnet_peering_2" {
  name                      = var.vnet_peering_2_name
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.vnet_2.name
  remote_virtual_network_id = azurerm_virtual_network.vnet_1.id
}