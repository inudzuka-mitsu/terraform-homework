/*
Create folder Homework4 and perform following:
Generate Terraform code that creates key, security group, ec2 instance.

Following should be created as variables:
Region
Key name
Ports (22, 80, 443)
Availability zone
Instance type
AMI Id
Count

Create tfvars file for all 4 regions and test deploying in all 4 regions. Destroy everything after creation.
In a README.md file provide documentation how to use tfvars file.
*/

provider "aws" {
  region = var.region
}

variable "region" {
  type = string
}

variable "key_name" {
  type = string
}

variable "ports" {
  type = set(number)
}

variable "az" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_count" {
  type = number
}

resource "aws_instance" "web" {
  ami               = var.ami_id
  instance_type     = var.instance_type
  key_name          = var.key_name
  count             = var.instance_count
  availability_zone = var.az
  tags = {
    Name = "ec2 in ${var.az}"
  }
}
