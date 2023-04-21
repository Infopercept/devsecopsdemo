resource "tls_private_key" "filebeat_key_temp" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "local_file" "filebeat_key_temp_file" {
  content  = tls_private_key.filebeat_key_temp.private_key_pem
  filename = "tmp/filebeat-key-temp.pem"
}

resource "null_resource" "filebeat_key_pkcs8" {
  triggers = {
    filebeat_key_temp_pem = local_file.filebeat_key_temp_file.content
  }

  provisioner "local-exec" {
    command = "openssl pkcs8 -inform PEM -outform PEM -in tmp/filebeat-key-temp.pem -topk8 -nocrypt -v1 PBE-SHA1-3DES -out cert/filebeat-key.pem"
  }
}

resource "tls_cert_request" "filebeat" {
  private_key_pem = tls_private_key.filebeat_key_temp.private_key_pem

  subject {
    country      = "US"
    locality     = "California"
    organization = "Company"
    common_name  = "filebeat"
  }
}

resource "tls_locally_signed_cert" "filebeat" {
  cert_request_pem   = tls_cert_request.filebeat.cert_request_pem
  ca_private_key_pem = tls_private_key.root_ca_key.private_key_pem
  ca_cert_pem        = tls_self_signed_cert.root_ca.cert_pem

  validity_period_hours = 8760 * 10

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
    "client_auth",
  ]
}

resource "local_file" "filebeat_key_cert_file" {
  content  = tls_locally_signed_cert.filebeat.cert_pem
  filename = "cert/filebeat.pem"
}
