output "cert_key_pem" {
  value = "${var.output_directory}/${var.cert_name}-key.pem"
}

output "cert_pem" {
  value = tls_locally_signed_cert.cert.cert_pem
}
