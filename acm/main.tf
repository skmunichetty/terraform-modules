data "aws_ssm_parameter" "certificate_body" {
  name            = var.certificate_body_ssm_parameter_name
  with_decryption = true
}

data "aws_ssm_parameter" "private_key" {
  name            = var.private_key_ssm_parameter_name
  with_decryption = true
}

data "aws_ssm_parameter" "certificate_chain" {
  count = var.certificate_chain_ssm_parameter_name == null ? 0 : 1

  name            = var.certificate_chain_ssm_parameter_name
  with_decryption = true
}

resource "aws_acm_certificate" "this" {
  certificate_body  = data.aws_ssm_parameter.certificate_body.value
  private_key       = data.aws_ssm_parameter.private_key.value
  certificate_chain = var.certificate_chain_ssm_parameter_name == null ? null : data.aws_ssm_parameter.certificate_chain[0].value

  tags = var.tags

  lifecycle {
    create_before_destroy = true
  }
}
