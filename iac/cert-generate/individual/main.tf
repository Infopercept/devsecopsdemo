terraform {
  required_providers {
    tls = {
      source = "hashicorp/tls"
    }
  }
}

provider "tls" {}

resource "tls_private_key" "root_ca_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "tls_self_signed_cert" "root_ca" {
  private_key_pem   = tls_private_key.root_ca_key.private_key_pem
  is_ca_certificate = true

  subject {
    country      = "US"
    locality     = "California"
    organization = "Company"
    common_name  = "root-ca"
  }

  validity_period_hours = 8760 * 10

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "cert_signing",
  ]
}

resource "local_file" "root_ca_file" {
  content  = tls_self_signed_cert.root_ca.cert_pem
  filename = "cert/root-ca.pem"
}