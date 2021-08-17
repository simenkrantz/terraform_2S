provider "aws" {
  profile = "default"
  region  = var.aws_region
}

module "aws_vpc_main" {
  // Must be applied before module.aws_subnets
  source          = "./VPC"
  region          = var.aws_region
  main_cidr_block = "10.0.0.0/16"
}

module "aws_subnets" {
  // Must be applied after module.aws_vpc_main
  source      = "./aws_subnets"
  region      = var.aws_region
  subnets_map = {
    "subnet_01" = {
      vpc_id = module.aws_vpc_main.main_vpc_id
      cidr_block = "10.0.0.0/24"
    }
    "subnet_02" = {
      vpc_id = module.aws_vpc_main.main_vpc_id
      cidr_block = "10.0.1.0/24"
    }
    "subnet_03" = {
      vpc_id = module.aws_vpc_main.main_vpc_id
      cidr_block = "10.0.2.0/24"
    }
    "subnet_04" = {
      vpc_id = module.aws_vpc_main.main_vpc_id
      cidr_block = "10.0.3.0/24"
    }
    "subnet_05" = {
      vpc_id = module.aws_vpc_main.main_vpc_id
      cidr_block = "10.0.4.0/24"
    }
  }
}