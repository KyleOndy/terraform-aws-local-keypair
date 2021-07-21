Easily create a new keypair in AWS and drop the local key into your working directory.

# AWS Local Keypair

To limit blast radius I provision new keys for each atomic set of infrastructure I create in terraform.

## Useage

```hcl
module "key" {
  source      = "git@github.com:KyleOndy/terraform-aws-local-keypair.git?ref=v0.1.0"
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
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_local"></a> [local](#provider\_local) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_key_pair.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [local_file.private_key](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [random_pet.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |
| [tls_private_key.this](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | name of keypair in AWS | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_filename"></a> [filename](#output\_filename) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
