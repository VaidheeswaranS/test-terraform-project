terraform {
    required_version = ">= 0.11.11"
    backend "s3" {
        bucket = "terraform-remote-state-12354"
        key    = "alb-web/terraform.tfstate"
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