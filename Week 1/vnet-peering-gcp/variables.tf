variable "project" {}

variable "credentials_file" {}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "zone" {
  type    = string
  default = "us-central1-c"
}

variable "vpc_network_1_name" {
  type    = string
  default = "vpc-network-1"
}

variable "vpc_network_2_name" {
  type    = string
  default = "vpc-network-2"
}

variable "peering_1_name" {
  type    = string
  default = "peer1to2"
}

variable "peering_2_name" {
  type    = string
  default = "peer2to1"
}