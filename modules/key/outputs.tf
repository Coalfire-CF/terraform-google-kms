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
