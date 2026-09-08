output "certificate_arn" {
  description = "ARN of the imported ACM certificate."
  value       = module.acm_certificate.certificate_arn
}

output "domain_name" {
  description = "Primary domain name on the imported certificate."
  value       = module.acm_certificate.domain_name
}

output "status" {
  description = "Status of the imported ACM certificate."
  value       = module.acm_certificate.status
}
