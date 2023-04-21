resource "tls_private_key" "node_key_temp" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "local_file" "node_key_temp_file" {
  content  = tls_private_key.node_key_temp.private_key_pem
  filename = "tmp/node-key-temp.pem"
}

resource "null_resource" "node_key_pkcs8" {
  triggers = {
    node_key_temp_pem = local_file.node_key_temp_file.content
  }

  provisioner "local-exec" {
    command = "openssl pkcs8 -inform PEM -outform PEM -in tmp/node-key-temp.pem -topk8 -nocrypt -v1 PBE-SHA1-3DES -out cert/node-key.pem"
  }
}

resource "tls_cert_request" "node" {
  private_key_pem = tls_private_key.node_key_temp.private_key_pem

  subject {
    country      = "US"
    locality     = "California"
    organization = "Company"
    common_name  = "node"
  }
}

resource "tls_locally_signed_cert" "node" {
  cert_request_pem   = tls_cert_request.node.cert_request_pem
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

resource "local_file" "node_key_cert_file" {
  content  = tls_locally_signed_cert.node.cert_pem
  filename = "cert/node.pem"
}