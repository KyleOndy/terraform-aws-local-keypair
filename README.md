# AWS Local Keypair

Easily create a new keypair in AWS and drop the local key into your working directory.

## Useage

```hcl
module "key" {
  source      = "git@github.com:KyleOndy/terraform-aws-local-keypair.git"
  name_prefix = "gitlab-runner"
  tags        = { owner = "Kyle Ondy" }
}

resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = "t3.micro"
  key_name      = module.key.name
}
```

If you are using a windows AMI, you can get the password.


```hcl
output "password" {
  value = rsadecrypt(aws_instance.this.password_data, file(module.key.filename))
}
``
