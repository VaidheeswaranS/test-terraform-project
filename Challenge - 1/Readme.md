
Challenge - 1 - Architecture
=============================

# Pre-requisites

- Install the [awscliv2](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) depending on your OS

- Install the [terraform](https://www.terraform.io/downloads.html)

- Configure the Access and Secret keys for building the infra using terraform

- Create a key pair in `London (eu-west-2)` that will used for ec2 instances during creation

# Architecture Digram

![Architecture](kpmg.jpg)

# Creating the infra

- Create the infra in the following order
    ```
    - Go to the Terraform -> Resources -> vpc to create the VPC
    - Go to the Terraform -> Resources -> ec2-web to create the web instances
    - Go to the Terraform -> Resources -> ec2-app to create the app instances
    - Go to the Terraform -> Resources -> alb-web to create the web alb
    - Go to the Terraform -> Resources -> alb-app to create the app alb
    - Go to the Terraform -> Resources -> rds to create the RDS
    ```

- Commands to create the resources after going into the folder
    ```
    terraform init
    terraform plan
    terraform apply
    ```
- The code has been written to use the `London (eu-west-2)` to create all the resources