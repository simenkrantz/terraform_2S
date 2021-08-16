vnet_name = "example_virtual_network"

vnet_adress = [
  "10.0.0.0/16"
]

subnet_name = "example_subnet_1"

subnet_adress = [
  "10.0.1.0/24"
]

subnets_map = {
  "1_subnet" = {
    address_space = ["10.0.0.0/1"]
    name          = "test_subnet_1"
  }
  "2_subnet" = {
    address_space = ["10.0.0.1/1"]
    name          = "test_subnet_2"
  }
}