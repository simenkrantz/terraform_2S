provider "azurerm" {
  subscription_id = var.sub_id
  features {}
}

resource "azurerm_resource_group" "r_g_test" {
  name     = var.resource_group_name
  location = var.location
}
