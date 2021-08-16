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