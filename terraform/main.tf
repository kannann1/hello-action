terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  backend "s3" {
    bucket = "ragul-bucket-eps"
    key    = "state.tfstate"
    region = "us-east-1"
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}



resource "aws_instance" "app_server" {
  ami                         = "ami-04b4f1a9cf54c11d0"
  instance_type               = var.instance_type
  key_name                    = "abc"
  subnet_id                   = "subnet-093055aa5dad1310a"
  associate_public_ip_address = true
  vpc_security_group_ids      = ["sg-071af51fa4fe8aea2"]


  tags = {
    Name     = "TF module"
    Project  = "DevOps Team"
    CostCode = "12345"
  }
}
