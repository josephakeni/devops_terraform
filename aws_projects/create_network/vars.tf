# variable "profile" {
#   default = "devop03"
# }

variable "region" {
  default = "eu-west-1"
}

variable "tenancy" {
  type    = string
  default = "default"
  # description = "description"
}

variable "main_vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
  # description = "description"
}

variable "public_subnet_a_cidr" {
  default = "10.0.0.0/24"
}

variable "public_subnet_b_cidr" {
  default = "10.0.1.0/24"
}

variable "public_subnet_c_cidr" {
  default = "10.0.2.0/24"
}

variable "private_subnet_a_cidr" {
  default = "10.0.16.0/20"
}

variable "private_subnet_b_cidr" {
  default = "10.0.32.0/20"
}

