provider "aws" {
  region = "ap-northeast-2"
}

terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }
}

resource "aws_instance" "ec2_dev_instance" {
  ami = "ami-0e6f2b2fa0ca704d0"
}