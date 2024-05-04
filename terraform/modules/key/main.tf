terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }
}

resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "aws_key_pair" "make_key_pair" {
  key_name = var.ec2_tls_private_key
  public_key = tls_private_key.ec2_key.public_key_openssh
}

resource "local_file" "download_key" {
  filename = var.key_download_path
  content = tls_private_key.ec2_key.private_key_pem
}