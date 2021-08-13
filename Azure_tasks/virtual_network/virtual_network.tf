provider "azurerm" {
  subscription_id = "a4867892-6250-46e3-91cb-86c0d43d7b32"
  features {}
}

data "azurerm_resource_group" "rg" {
  name = "first_resource_group"
}

/* Importing resources
    'terraform import RESOURCE_TYPE.REFERENCE_NAME RESOURCE_ID'
    terraform import azurerm_subnet.subnet_example /subscriptions/a4867892-6250-46e3-91cb-86c0d43d7b32/resourceGroups/first_resource_group/providers/Microsoft.Network/virtualNetworks/example_virtual_network/subnets/example_subnet_1
*/
#resource "azurerm_subnet" "subnet_example" {
#  name                 = var.subnet_name
#  address_prefixes     = var.subnet_adress
#  virtual_network_name = azurerm_virtual_network.example.name
#  resource_group_name  = data.azurerm_resource_group.rg.name
#}

resource "azurerm_virtual_network" "example" {
  name                = var.vnet_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  address_space       = var.vnet_adress
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
}

resource "azurerm_subnet" "subnet_foreach" {
  for_each             = var.subnets_map
  name                 = each.value.name
  address_prefixes     = each.value.address_space
  virtual_network_name = azurerm_virtual_network.example.name
  resource_group_name  = data.azurerm_resource_group.rg.name
}