variable "project_id" {
  description = "Project id where the keyring will be created."
  type        = string
}

variable "region" {
  description = "The location for the KeyRing. A full list of valid locations can be found by running gcloud kms locations list."
  type = string
}

variable "keyring" {
  description = "Keyring name."
  type        = string
}

variable "location" {
  description = "Location for the keyring."
  type        = string
}

variable "keys" {
  description = "Key names."
  type        = list(string)
  default     = []
}

variable "key_rotation_period" {
  description = "Generate a new key every time this period passes."
  type        = string
  default     = "100000s"
}

variable "purpose" {
  type        = string
  description = "The immutable purpose of the CryptoKey. Possible values are ENCRYPT_DECRYPT, ASYMMETRIC_SIGN, and ASYMMETRIC_DECRYPT."
  default     = "ENCRYPT_DECRYPT"
}

variable "key_algorithm" {
  type        = string
  description = "The algorithm to use when creating a version based on this template. See the https://cloud.google.com/kms/docs/reference/rest/v1/CryptoKeyVersionAlgorithm for possible inputs."
  default     = "GOOGLE_SYMMETRIC_ENCRYPTION"
}

variable "key_protection_level" {
  type        = string
  description = "The protection level to use when creating a version based on this template. Default value: \"SOFTWARE\" Possible values: [\"SOFTWARE\", \"HSM\"]"
  default     = "SOFTWARE"
}

variable "labels" {
  type        = map(string)
  description = "Labels, provided as a map"
  default     = {}
}
