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

variable "common_name" {
  type    = string
  default = "root-ca"
}

variable "validity_period_hours" {
  type    = number
  default = 8760 * 10
}

variable "output_directory" {
  type = string
}

