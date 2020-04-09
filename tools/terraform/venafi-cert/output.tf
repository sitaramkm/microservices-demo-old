/////////////////////////////
///// Venafi Outputs

output "venafi_certificate" {
  value       = venafi_certificate.web.certificate
  description = "The X509 certificate in PEM format."
  sensitive = "true"
}

output "venafi_chain" {
  value       = venafi_certificate.web.chain
  description = "The trust chain of X509 certificate authority certificates in PEM format concatenated together."
  sensitive = "true"
}

output "venafi_private_key_pem" {
  value       = venafi_certificate.web.private_key_pem
  description = "The private key in PEM format."
  sensitive   = "true"
}

output "acm_cert_arn" {
    value         = aws_acm_certificate.cert.arn
    description   = "ARN of the certificate imported into ACM"
}
