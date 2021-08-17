terraform {
  required_version = "~> 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 0.14.9"
    }
    azure = {
      source  = "hashicorp/azurerm"
      version = "~> 2.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

variable "subnet_prefix" {
  description = "List of subnet prefixes, two out of three are identical."
  type = list
  default = [
    {
      cidr_block = "10.0.1.0/32"
      name = "subnet-1"
    },
    {
      cidr_block = "10.0.1.0/32"
      name = "subnet-1"
    },
    {
      cidr_block = "10.0.2.0/32"
      name = "subnet-2"
    }
  ]
}

data "aws_subnet" "test_subnet" {
  count = "${length(data.aws_subnet.test_subnet.tags.Name)}"
  name = "${tolist()}"
}

variable "main_cidr_block" {
  description = "VPC CIDR block, default: 10.0.0.0/16"
  type = string
  default = "10.0.0.0/16"
}

resource "aws_vpc" "main_vpc" {
  cidr_block = var.main_cidr_block
  tags = {
    Name = "aws_vpc"
  }
}

resource "aws_subnet" "example" {
  #count = "${contains(local.deployed_resources, var.subnet_prefix[count.index]) ? 0 : 1}"
  #count = "${length(var.subnet_prefix)}"
  #count = "${length(distinct(var.subnet_prefix))}"

  vpc_id = aws_vpc.main_vpc.id
  cidr_block = "${lookup(element(var.subnet_prefix, count.index), "cidr_block")}"
  tags = {
    Name = "${lookup(element(var.subnet_prefix, count.index), "name")}"
  }
}