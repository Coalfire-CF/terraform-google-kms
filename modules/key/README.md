# KMS Key

Creates a single KMS key in a specified KMS key ring.

## Usage

```hcl
module "kms" {
  source = "github.com/Coalfire-CF/terraform-gcp-kms//modules/key"

  key_ring_id = "your-key-ring-id"
  key         = "private-ca"

  purpose             = "ASYMMETRIC_SIGN"
  key_algorithm       = "RSA_SIGN_PKCS1_4096_SHA512"
}

```