provider "azurerm" {
  subscription_id = "a4867892-6250-46e3-91cb-86c0d43d7b32"
  features {}
}

module "module_resource_group" {
  source = "./resource_group"
}

module "module_vn" {
  source    = "./virtual_network"
  vnet_name = "example_virtual_network"
  vnet_adress = [
    "10.0.0.0/16"
  ]
  subnets_map = {
    "1_subnet" = {
      address_space = ["10.0.0.0/24"]
      name          = "test_subnet_1"
    }
    "2_subnet" = {
      address_space = ["10.0.1.0/24"]
      name          = "test_subnet_2"
    }
  }
}