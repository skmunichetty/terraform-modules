# ACM certificate from SSM

Imports a PEM certificate into AWS Certificate Manager by reading the certificate body, private key, and optional certificate chain from AWS Systems Manager Parameter Store.

The source parameters remain in SSM. Terraform reads their values and manages an `aws_acm_certificate` resource in ACM.

## Usage

```hcl
module "acm_certificate" {
  source = "git::https://github.com/skmunichetty/terraform-modules.git//acm?ref=<version>"

  certificate_body_ssm_parameter_name  = var.certificate_body_parameter_name
  private_key_ssm_parameter_name       = var.private_key_parameter_name
  certificate_chain_ssm_parameter_name = var.certificate_chain_parameter_name

  tags = {
    ManagedBy = "Terraform"
  }
}
```

Omit `certificate_chain_ssm_parameter_name` when the issuing CA did not provide a chain.

## Required AWS permissions

The calling Terraform role needs permission to read the selected SSM parameters, decrypt them when a customer-managed KMS key is used, and manage imported ACM certificates.

## Security

Terraform state contains the imported certificate material, including the private key. Use an encrypted remote backend, tightly restrict state access, and never expose these values as outputs.
