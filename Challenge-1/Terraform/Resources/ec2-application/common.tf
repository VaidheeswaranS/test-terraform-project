terraform {
    required_version = ">= 0.11.11"
    backend "s3" {
        bucket = "terraform-tfstate-kpmg"
        key    = "ec2-application/terraform.tfstate"
        region = "eu-west-2"
    }
}

data "terraform_remote_state" "vpc" {
    backend = "s3"

    config = {
        bucket = "terraform-tfstate-kpmg"
        key = "vpc/terraform.tfstate"
        region = "eu-west-2"
    }
}

data "aws_subnet_ids" "subnet_ids" {
    vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
    tags   = {
        Name = var.subnet_filter
    }
}

provider "aws" {
    region     = var.aws_region
}