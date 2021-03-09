# AWS Local Keypair

Easily create a new keypair in AWS and drop the local key into your working directory.

## Useage

```hcl
module "key" {
  source      = "git@github.com:KyleOndy/terraform-aws-local-keypair.git"
  name_prefix = "gitlab-runner"
  tags        = { owner = "Given.Surname" }
}
```
