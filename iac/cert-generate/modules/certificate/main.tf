resource "tls_private_key" "cert_key_temp" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "local_file" "cert_key_temp_file" {
  content  = tls_private_key.cert_key_temp.private_key_pem
  filename = "${var.temp_directory}/${var.cert_name}-key-temp.pem"
}

resource "null_resource" "cert_key_pkcs8" {
  triggers = {
    cert_key_temp_pem = local_file.cert_key_temp_file.content
  }

  provisioner "local-exec" {
    command = "openssl pkcs8 -inform PEM -outform PEM -in ${var.temp_directory}/${var.cert_name}-key-temp.pem -topk8 -nocrypt -v1 PBE-SHA1-3DES -out ${var.output_directory}/${var.cert_name}-key.pem"
  }
}

resource "tls_cert_request" "cert" {
  private_key_pem = tls_private_key.cert_key_temp.private_key_pem

  subject {
    country      = var.country
    locality     = var.locality
    organization = var.organization
    common_name  = var.cert_name
  }
}

resource "tls_locally_signed_cert" "cert" {
  cert_request_pem      = tls_cert_request.cert.cert_request_pem
  ca_private_key_pem    = var.ca_private_key_pem
  ca_cert_pem           = var.ca_cert_pem
  validity_period_hours = var.validity_period_hours
  allowed_uses          = var.allowed_uses
}

resource "local_file" "admin_key_cert_file" {
  content  = tls_locally_signed_cert.cert.cert_pem
  filename = "${var.output_directory}/${var.cert_name}.pem"
}
