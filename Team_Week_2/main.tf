provider "azurerm" {
  subscription_id = "a4867892-6250-46e3-91cb-86c0d43d7b32"
  features {}
}

module "rg" {
  source = "./resource_group"
  resource_group_name = "rg_team"
  location = "westeurope"
}

module "network" {
  source = "./network"
  rg_name = "rg_team"
  vnet_name = "vn_test"
  vnet_adress = ["10.0.0.0/16", "10.1.0.0/16"]
  num_net = 2
  num_subnet = 2
  subnet_prefix = ["10.0.0.0/24","10.0.1.0/24"]
}

module "vm" {
  source = "./vm"
  admin_pwd = "wefv5T@k7h683"
  num_subnet = 2
}

