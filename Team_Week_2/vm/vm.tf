data "azurerm_resource_group" "rg" {
  name = "rg_team"
}

data "azurerm_network_interface" "nic" {
  count = var.num_subnet
  name = "nic-${count.index}"
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_linux_virtual_machine" "example" {
  count = var.num_subnet
  name                = "linux-vm-${count.index}"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  size                = "Standard_F2"
  disable_password_authentication = false
  admin_username      = "adminuser"
  admin_password = var.admin_pwd
  network_interface_ids = [
    element(data.azurerm_network_interface.nic.*.id, count.index)
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}