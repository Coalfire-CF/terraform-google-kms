output "key_id" {
  description = "KMS key ID."
  value       = google_kms_crypto_key.key.id
}

output "version_id" {
  description = "KMS key version ID."
  value       = data.google_kms_crypto_key_version.version.id
}

output "version_name" {
  description = "KMS key version name."
  value       = data.google_kms_crypto_key_version.version.name
}

output "kms_public_key_value" {
  value = try(data.google_kms_crypto_key_version.version.public_key, "Error: Only Asymmetric keys have public key value")
}