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

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_kms_crypto_key.key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_crypto_key) | resource |
| [google_kms_key_ring.key_ring](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_key_ring) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_key_algorithm"></a> [key\_algorithm](#input\_key\_algorithm) | The algorithm to use when creating a version based on this template. See the https://cloud.google.com/kms/docs/reference/rest/v1/CryptoKeyVersionAlgorithm for possible inputs. | `string` | `"GOOGLE_SYMMETRIC_ENCRYPTION"` | no |
| <a name="input_key_protection_level"></a> [key\_protection\_level](#input\_key\_protection\_level) | The protection level to use when creating a version based on this template. Default value: "SOFTWARE" Possible values: ["SOFTWARE", "HSM"] | `string` | `"SOFTWARE"` | no |
| <a name="input_key_rotation_period"></a> [key\_rotation\_period](#input\_key\_rotation\_period) | Generate a new key every time this period passes. | `string` | `"100000s"` | no |
| <a name="input_keyring"></a> [keyring](#input\_keyring) | Keyring name. | `string` | n/a | yes |
| <a name="input_keys"></a> [keys](#input\_keys) | Key names. | `list(string)` | `[]` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Labels, provided as a map | `map(string)` | `{}` | no |
| <a name="input_location"></a> [location](#input\_location) | Location for the keyring. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project id where the keyring will be created. | `string` | n/a | yes |
| <a name="input_purpose"></a> [purpose](#input\_purpose) | The immutable purpose of the CryptoKey. Possible values are ENCRYPT\_DECRYPT, ASYMMETRIC\_SIGN, and ASYMMETRIC\_DECRYPT. | `string` | `"ENCRYPT_DECRYPT"` | no |
| <a name="input_region"></a> [region](#input\_region) | The location for the KeyRing. A full list of valid locations can be found by running gcloud kms locations list. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_keyring"></a> [keyring](#output\_keyring) | Self link of the keyring. |
| <a name="output_keyring_name"></a> [keyring\_name](#output\_keyring\_name) | Name of the keyring. |
| <a name="output_keyring_resource"></a> [keyring\_resource](#output\_keyring\_resource) | Keyring resource. |
| <a name="output_keys"></a> [keys](#output\_keys) | Map of key name => key self link. |
<!-- END_TF_DOCS -->