resource "tls_private_key" "this" {
  algorithm = "RSA"
}

resource "random_pet" "this" {}

locals {
  key_name = "${var.name_prefix}-${random_pet.this.id}"
}

resource "local_sensitive_file" "private_key" {
  content         = tls_private_key.this.private_key_pem
  filename        = "${local.key_name}.key"
  file_permission = "0600"
}

resource "aws_key_pair" "this" {
  key_name   = local.key_name
  public_key = tls_private_key.this.public_key_openssh
  tags       = var.tags
}
