data "azurerm_resource_group" "rg" {
  name = var.rg_name
}

locals {
  product = "${setproduct(var.num_net, var.num_subnet)}"
}

resource "azurerm_virtual_network" "example" {
  count = "${length(local.product)}"
  name                = "${var.vnet_name}-${count.index}"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  address_space       = [element(var.vnet_adress, count.index)]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
}

resource "azurerm_subnet" "subnets" {
  count = length(var.subnet_prefix)
  name = "subnet-${count.index}"
  address_prefixes     = [element(var.subnet_prefix, count.index)]
  virtual_network_name = element(azurerm_virtual_network.example.*.name, count.index)
  resource_group_name  = data.azurerm_resource_group.rg.name
}

resource "azurerm_network_interface" "nic" {
  count = var.num_subnet
  name = "nic-${count.index}"
  location = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  ip_configuration {
    name                          = "internal-${count.index}"
    subnet_id                     = azurerm_subnet.subnets[count.index].id
    private_ip_address_allocation = "Dynamic"
  }
}