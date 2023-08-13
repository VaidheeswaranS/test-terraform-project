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
        key    = "ec2-web/terraform.tfstate"
        region = "us-west-2"
    }
}

data "terraform_remote_state" "vpc" {
    backend = "s3"

    config = {
        bucket = "terraform-remote-state-12354"
        key = "vpc/terraform.tfstate"
        region = "us-west-2"
    }
}

data "aws_subnets" "subnet_ids" {

    filter {
        name = "vpc-id"
        values = [data.terraform_remote_state.vpc.outputs.vpc_id]
    }
    tags   = {
        Name = var.subnet_filter
    }
}

provider "aws" {
    region     = var.aws_region
}