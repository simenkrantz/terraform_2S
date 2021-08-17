provider "aws" {
  region = var.region
}

resource "aws_vpc" "main_vpc" {
  cidr_block = var.main_cidr_block
  tags = {
    Name = "main_aws_vpc"
  }
}
