terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "eu-west-2"
}

resource "aws_vpc" "vpc_1" {
  cidr_block = "10.1.0.0/16"
}

resource "aws_vpc" "vpc_2" {
  cidr_block = "10.2.0.0/16"
}

resource "aws_vpc_peering_connection" "vpc_peering" {
  peer_vpc_id = aws_vpc.vpc_2.id
  vpc_id      = aws_vpc.vpc_1.id
  auto_accept = true

  tags = {
    Name = "VPC Peering between vpc_1 and vpc_2"
  }
}