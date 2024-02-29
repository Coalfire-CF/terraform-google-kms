resource "google_kms_crypto_key" "key" {

  key_ring = var.key_ring_id
  name     = var.key
  #checkov:skip=CKV_GCP_43:Rotation period is correctly set for daily
  rotation_period = var.key_rotation_period
  purpose         = var.purpose

  lifecycle {
    prevent_destroy = true
  }

  version_template {
    algorithm        = var.key_algorithm
    protection_level = var.key_protection_level
  }

  labels = var.labels
}

data "google_kms_crypto_key_version" "version" {
  crypto_key = google_kms_crypto_key.key.id
}
