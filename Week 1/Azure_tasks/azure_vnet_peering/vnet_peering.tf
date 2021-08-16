data "azurerm_resource_group" "rg" {
  name = "first_resource_group"
}

data "azurerm_virtual_network" "vnet_example" {
  name                = var.vnet_example_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_virtual_network" "vnet_peered" {
  name                = var.vnet_name_peered
  resource_group_name = data.azurerm_resource_group.rg.name
  address_space       = var.addr_space_peered
  location            = data.azurerm_resource_group.rg.location
}

resource "azurerm_virtual_network_peering" "example_peered" {
  name                      = "peer_e2p"
  resource_group_name       = data.azurerm_resource_group.rg.name
  virtual_network_name      = data.azurerm_virtual_network.vnet_example.name
  remote_virtual_network_id = azurerm_virtual_network.vnet_peered.id
}

resource "azurerm_virtual_network_peering" "peered_example" {
  name                      = "peer_p2e"
  resource_group_name       = data.azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.vnet_peered.name
  remote_virtual_network_id = data.azurerm_virtual_network.vnet_example.id
}