terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.61.0"
    }
  }
}

provider "aws" {
  region = var.region-name
}

# create default vpc if one does not exit
resource "aws_default_vpc" "default_vpc" {
}