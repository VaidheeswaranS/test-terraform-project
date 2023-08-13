terraform {
    required_providers {
      
      aws = {
        source = "hashicorp/aws"
        version = "5.10.0"
      }
    }

    required_version = ">= 1.1"

    backend "s3" {
        bucket = "terraform-remote-state-12354"
        key    = "vpc/terraform.tfstate"
        region = "us-west-2"
    }
}

provider "aws" {
    region     = var.aws_region
}