terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }
}
#configure the AWS providers
provider "aws" {
    region = "us-east-1"
    access_key = "AWS_SECRET_ACCESS_KEY"
    secret_key = "AWS_SECRET_ACCESS_KEY"
}

# Create a VPC 
resource "aws_vpc" "dev" {
    cidr_block = "10.0.0.0/16"  
}
# Create a new EC2 instance 
resource "aws_instance" "amazon-linux" {
  ami               = "ami-01816d07b1128cd2d"
  instance_type     = "t2.micro"
  vpc_security_group_ids =["sg-03ca6642db5fffb33"]
  subnet_id              = "subnet-091a6ef30a3aeedce"
  monitoring             = false
  key_name          = "N.virgina-linux-key-pair"
  tags = {
    Name = "Amazon-Linux-Server"
  }
}
