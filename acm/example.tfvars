certificate_body_ssm_parameter_name  = "/example/certificates/service/certificate"
private_key_ssm_parameter_name       = "/example/certificates/service/private-key"
certificate_chain_ssm_parameter_name = "/example/certificates/service/certificate-chain"

tags = {
  Environment = "test"
  ManagedBy   = "Terraform"
}
