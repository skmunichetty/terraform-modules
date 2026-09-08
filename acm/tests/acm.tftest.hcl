mock_provider "aws" {}

run "imports_certificate_without_chain" {
  command = plan

  variables {
    certificate_body_ssm_parameter_name = "/test/certificate"
    private_key_ssm_parameter_name      = "/test/private-key"
    tags = {
      Environment = "test"
    }
  }

  override_data {
    target = data.aws_ssm_parameter.certificate_body
    values = {
      value = "mock-certificate-body"
    }
  }

  override_data {
    target = data.aws_ssm_parameter.private_key
    values = {
      value = "mock-private-key"
    }
  }

  assert {
    condition     = aws_acm_certificate.this.certificate_body == "mock-certificate-body"
    error_message = "The ACM certificate body must come from the configured SSM parameter."
  }

  assert {
    condition     = aws_acm_certificate.this.private_key == "mock-private-key"
    error_message = "The ACM private key must come from the configured SSM parameter."
  }

  assert {
    condition     = aws_acm_certificate.this.certificate_chain == null
    error_message = "The certificate chain must be omitted when no chain parameter is supplied."
  }

  assert {
    condition     = aws_acm_certificate.this.tags["Environment"] == "test"
    error_message = "The module must apply the supplied tags."
  }
}

run "imports_certificate_with_chain" {
  command = plan

  variables {
    certificate_body_ssm_parameter_name  = "/test/certificate"
    private_key_ssm_parameter_name       = "/test/private-key"
    certificate_chain_ssm_parameter_name = "/test/certificate-chain"
  }

  override_data {
    target = data.aws_ssm_parameter.certificate_body
    values = {
      value = "mock-certificate-body"
    }
  }

  override_data {
    target = data.aws_ssm_parameter.private_key
    values = {
      value = "mock-private-key"
    }
  }

  override_data {
    target = data.aws_ssm_parameter.certificate_chain[0]
    values = {
      value = "mock-certificate-chain"
    }
  }

  assert {
    condition     = length(data.aws_ssm_parameter.certificate_chain) == 1
    error_message = "The module must read the chain parameter when one is supplied."
  }

  assert {
    condition     = aws_acm_certificate.this.certificate_chain == "mock-certificate-chain"
    error_message = "The ACM certificate chain must come from the configured SSM parameter."
  }
}
