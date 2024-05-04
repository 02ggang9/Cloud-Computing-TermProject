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

resource "aws_iam_user" "admin_user" {
  name = "admin_user"
}

resource "aws_iam_user_policy_attachment" "admin_policy_attach" {
  user = aws_iam_user.admin_user
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}