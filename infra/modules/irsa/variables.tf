variable "role_name" {
  description = "Name of the role"
  type        = string
}

variable "oidc_provider_arn" {
  description = "Trust this provider"
  type        = string
}

variable "oidc_issuer" {
  description = "OIDC issuer URL, used in the trust condition"
  type        = string
}

variable "namespace" {
  description = "Namespace the service account lives in"
  type        = string
}

variable "service_account" {
  description = "Service account allowed to use this role"
  type        = string
}

variable "policy_json" {
  description = "Permissions for the role, as a JSON policy"
  type        = string
}
