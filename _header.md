![Coalfire](coalfire_logo.png)


# Google Cloud KMS Terraform Module

## Description

Simple Cloud KMS module that allows managing a keyring, zero or more keys in the keyring, and IAM role bindings on individual keys. Coalfire has tested this module with Terraform version 1.5.0 and the Hashicorp Google provider versions 4.70 - 5.0.

FedRAMP Compliance: High

### Usage

```
module "kms" {
  source = "github.com/Coalfire-CF/terraform-gcp-kms"

  project_id = "project-id"
  location   = var.region
  keyring    = "${var.keyring_prefix}-cmeks"
  keys       = local.cmeks

  key_rotation_period = "31536000s"

  depends_on = [
    time_sleep.wait
  ]
}
```

