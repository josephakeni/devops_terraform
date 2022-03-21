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

variable "environment" {
  default = ""
}

variable "name" {
  default = "jotonia"
}

variable "public_subnets" {
  type    = list(any)
  default = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  default = ["10.0.16.0/20", "10.0.32.0/20"]
}

variable "availability_zones" {
  type    = list(any)
  default = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}
