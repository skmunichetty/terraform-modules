output "certificate_arn" {
  description = "ARN of the imported ACM certificate."
  value       = aws_acm_certificate.this.arn
}

output "domain_name" {
  description = "Primary domain name on the imported certificate."
  value       = aws_acm_certificate.this.domain_name
}

output "status" {
  description = "Status of the imported ACM certificate."
  value       = aws_acm_certificate.this.status
}
