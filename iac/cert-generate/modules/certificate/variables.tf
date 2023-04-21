variable "country" {
  type    = string
  default = "US"
}

variable "locality" {
  type    = string
  default = "California"
}

variable "organization" {
  type    = string
  default = "Company"
}

variable "cert_name" {
  type = string
}

variable "output_directory" {
  type = string
}

variable "temp_directory" {
  type = string
}

variable "validity_period_hours" {
  type    = number
  default = 8760 * 10
}

variable "allowed_uses" {
  type    = list(string)
  default = ["key_encipherment", "digital_signature", "server_auth", "client_auth"]
}

variable "ca_private_key_pem" {
  type = string
}

variable "ca_cert_pem" {
  type = string
}
