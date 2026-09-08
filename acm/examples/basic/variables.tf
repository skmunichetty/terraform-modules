variable "aws_region" {
  description = "AWS region in which to import the ACM certificate."
  type        = string
}

variable "certificate_body_ssm_parameter_name" {
  description = "SSM parameter containing the PEM-encoded certificate body."
  type        = string
}

variable "private_key_ssm_parameter_name" {
  description = "SecureString SSM parameter containing the PEM-encoded private key."
  type        = string
}

variable "certificate_chain_ssm_parameter_name" {
  description = "Optional SSM parameter containing the PEM-encoded certificate chain."
  type        = string
  default     = null
  nullable    = true
}

variable "tags" {
  description = "Tags to apply to the ACM certificate."
  type        = map(string)
  default     = {}
}
