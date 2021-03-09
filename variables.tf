variable "name_prefix" {
  type        = string
  description = "name of keypair in AWS"
}

variable "tags" {
  type    = map(string)
  default = {}
}
