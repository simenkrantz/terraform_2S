provider "azurerm" {
  subscription_id = "a4867892-6250-46e3-91cb-86c0d43d7b32"
  features {}
}

resource "azurerm_resource_group" "r_g_test" {
  name     = var.var_resource_group_name
  location = var.var_location
  tags = {
    "foo" = "bar"
  }
}
