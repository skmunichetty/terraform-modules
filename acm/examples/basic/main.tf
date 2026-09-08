provider "aws" {
  region = var.aws_region
}

module "acm_certificate" {
  source = "../.."

  certificate_body_ssm_parameter_name  = var.certificate_body_ssm_parameter_name
  private_key_ssm_parameter_name       = var.private_key_ssm_parameter_name
  certificate_chain_ssm_parameter_name = var.certificate_chain_ssm_parameter_name

  tags = var.tags
}
