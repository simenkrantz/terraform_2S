provider "aws" {
  region = var.region
}

resource "aws_subnet" "aws_subnet" {
  for_each = var.subnets_map
  vpc_id = each.value.vpc_id
  cidr_block = each.value.cidr_block
}