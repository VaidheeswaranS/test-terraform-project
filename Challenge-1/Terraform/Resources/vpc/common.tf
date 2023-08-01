terraform {
    required_version = ">= 0.11.11"
    backend "s3" {
        bucket = "terraform-remote-state-12354"
        key    = "vpc/terraform.tfstate"
        region = "us-west-2"
    }
}

provider "aws" {
    region     = var.aws_region
}