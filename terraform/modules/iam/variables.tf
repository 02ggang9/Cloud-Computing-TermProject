# User name

variable "admin_user_name" {
  type = string
  default = "admin_user"
  description = "AWS IAM AdminFullAccess 권한의 그룹에 속한 User의 이름"
}

variable "cicd_user_name" {
  type = string
  default = "cicd_user"
  description = "AWS IAM  권한을 가진 User의 이름"
}

variable "dev_user_name" {
  type = string
  default = "dev_user"
  description = "AWS IAM AdminFullAccess 권한을 가진 User의 이름"
}

# Group name

variable "admin_group_name" {
  type = string
  default = "admin_group"
  description = "AWS IAM Admin 권한을 가진 Group의 이름"
}

variable "cicd_group_name" {
  type = string
  default = "cicd_group"
  description = "CICD에 필요한 권한을 가진 Group의 이름"
}

variable "dev_group_name" {
  type = string
  default = "dev_group"
  description = "Dev에 필요한 권한을 가진 Group의 이름"
}
