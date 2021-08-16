variable "resource_group_name" {
  type    = string
  default = "vnet-peering"
}

variable "location" {
  type    = string
  default = "westeurope"
}

variable "vnet_1_name" {
  type    = string
  default = "vnet-1"
}

variable "vnet_2_name" {
  type    = string
  default = "vnet-2"
}

variable "vnet_1_address_space" {
  type    = list(string)
  default = ["10.0.1.0/24"]
}

variable "vnet_2_address_space" {
  type    = list(string)
  default = ["10.0.2.0/24"]
}

variable "vnet_peering_1_name" {
  type    = string
  default = "peer1to2"
}

variable "vnet_peering_2_name" {
  type    = string
  default = "peer2to1"
}