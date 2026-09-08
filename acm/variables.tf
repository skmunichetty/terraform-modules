variable "certificate_body_ssm_parameter_name" {
  description = "Name or ARN of the SSM parameter containing the PEM-encoded certificate body."
  type        = string

  validation {
    condition     = length(trimspace(var.certificate_body_ssm_parameter_name)) > 0
    error_message = "certificate_body_ssm_parameter_name must not be empty."
  }
}

variable "private_key_ssm_parameter_name" {
  description = "Name or ARN of the SecureString SSM parameter containing the PEM-encoded private key."
  type        = string

  validation {
    condition     = length(trimspace(var.private_key_ssm_parameter_name)) > 0
    error_message = "private_key_ssm_parameter_name must not be empty."
  }
}

variable "certificate_chain_ssm_parameter_name" {
  description = "Optional name or ARN of the SSM parameter containing the PEM-encoded certificate chain."
  type        = string
  default     = null
  nullable    = true

  validation {
    condition     = var.certificate_chain_ssm_parameter_name == null || try(length(trimspace(var.certificate_chain_ssm_parameter_name)) > 0, false)
    error_message = "certificate_chain_ssm_parameter_name must be null or a non-empty value."
  }
}

variable "tags" {
  description = "Tags to apply to the ACM certificate."
  type        = map(string)
  default     = {}
}
