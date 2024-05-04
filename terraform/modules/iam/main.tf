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

# Create User

resource "aws_iam_user" "admin_user" {
  name = var.admin_user_name
}

resource "aws_iam_user" "cicd_user" {
  name = var.cicd_user_name
}

resource "aws_iam_user" "dev_user" {
  name = var.dev_user_name
}


# Create Group

resource "aws_iam_group" "admin_group" {
  name = var.admin_group_name
}

resource "aws_iam_group" "cicd_group" {
  name = var.cicd_group_name
}

resource "aws_iam_group" "dev_group" {
  name = var.dev_group_name
}


# Attach group policy

## admin
resource "aws_iam_group_policy_attachment" "admin_full_access" {
  group      = aws_iam_group.admin_group.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

## cicd
resource "aws_iam_group_policy_attachment" "ec2_container_registry_full_access" {
  group      = aws_iam_group.cicd_group.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}

resource "aws_iam_group_policy_attachment" "s3_full_access" {
  group      = aws_iam_group.cicd_group.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_group_policy_attachment" "cloud_front_full_access" {
  group      = aws_iam_group.cicd_group.name
  policy_arn = "arn:aws:iam::aws:policy/CloudFrontFullAccess"
}

## dev
resource "aws_iam_group_policy_attachment" "ec2_container_registry_read_access" {
  group      = aws_iam_group.dev_group.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

resource "aws_iam_group_policy_attachment" "ec2_read_access" {
  group      = aws_iam_group.dev_group.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}

resource "aws_iam_group_policy_attachment" "s3_read_access" {
  group      = aws_iam_group.dev_group.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}


# Add user to group

resource "aws_iam_group_membership" "admin_group_membership" {
  name = var.admin_group_name

  users = [ 
    aws_iam_user.admin_user.name
   ]

   group = aws_iam_group.admin_group.name
}

resource "aws_iam_group_membership" "cicd_group_membership" {
  name = var.cicd_group_name

  users = [ 
    aws_iam_user.cicd_user.name
   ]

   group = aws_iam_group.cicd_group.name
}

resource "aws_iam_group_membership" "dev_group_membership" {
  name = var.dev_group_name

  users = [ 
    aws_iam_user.dev_user.name
   ]

   group = aws_iam_group.dev_group.name
}
