resource "tls_private_key" "root_ca_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "tls_self_signed_cert" "root_ca" {
  private_key_pem = tls_private_key.root_ca_key.private_key_pem
  is_ca_certificate = true

  subject {
    country       = var.country
    locality      = var.locality
    organization  = var.organization
    common_name   = var.common_name
  }

  validity_period_hours = var.validity_period_hours

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "cert_signing",
  ]
}

resource "local_file" "cert_key_temp_file" {
  content  = tls_self_signed_cert.root_ca.cert_pem
  filename = "${var.output_directory}/root_ca.pem"
}
