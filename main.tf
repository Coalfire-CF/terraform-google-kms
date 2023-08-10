locals {
  keys_by_name = zipmap(var.keys, slice(google_kms_crypto_key.key[*].id, 0, length(var.keys)))
}

resource "google_kms_key_ring" "key_ring" {
  project = var.project_id

  name     = var.keyring
  location = var.location
}

resource "google_kms_crypto_key" "key" {
  count = length(var.keys)

  key_ring        = google_kms_key_ring.key_ring.id
  name            = var.keys[count.index]
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
