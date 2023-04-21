# This is the main root module, which calls the modules for the root CA and the
# certificates.
# This module accepts a list of certificate names to generate, and passes them to
# the certificate module.

terraform {
  required_providers {
    tls = {
      source = "hashicorp/tls"
    }
  }
}

provider "tls" {}

locals {
  certificate_names = ["admin", "dashboard", "filebeat", "node"]
}

module "root_ca" {
  source           = "./modules/root_ca"
  output_directory = "certs"
}

module "certificates" {

  for_each = toset(local.certificate_names)

  source = "./modules/certificate"

  cert_name          = each.value
  output_directory   = "certs"
  temp_directory     = "temp"
  ca_private_key_pem = module.root_ca.root_ca_key_pem
  ca_cert_pem        = module.root_ca.root_ca_pem
}

/*
output "root_ca_key_pem" {
  value = module.root_ca.root_ca_key_pem
}

output "root_ca_pem" {
  value = module.root_ca.root_ca_pem
}

output "certificate_key_pems" {
  value = {
    for cert_name in local.certificate_names : cert_name => module.certificates[cert_name].cert_key_pem
  }
}

output "certificate_pems" {
  value = {
    for cert_name in local.certificate_names : cert_name => module.certificates[cert_name].cert_pem
  }
}


module "certificate_admin" {
 
  source = "./modules/certificate"

  cert_name         = "admin"
  output_directory  = "certs"
  temp_directory    = "temp"
  ca_private_key_pem = module.root_ca.root_ca_key_pem
  ca_cert_pem        = module.root_ca.root_ca_pem
}

output "admin_key_pem" {
  value = module.certificate_admin.cert_key_pem
}

output "admin_cert_pem" {
  value = module.certificate_admin.cert_pem
}
*/
