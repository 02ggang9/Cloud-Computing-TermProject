variable "ec2_tls_private_key" {
  type = string
  default = "RSA"
  description = "TLS private key algorithm name"
}

variable "key_download_path" {
  type = string
  default = "cloud_computing.pem"
  description = "Key Download Path"
}