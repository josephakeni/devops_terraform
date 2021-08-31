variable "tenancy" {}

variable "main_vpc_cidr_block" {
    # default="10.0.0.0/16"  
}

variable "public_subnet_a_cidr" {
  # default="10.0.0.0/24"
}

variable "public_subnet_b_cidr" {
  # default="10.0.1.0/24"
}

variable "public_subnet_c_cidr" {
  # default="10.0.2.0/24"
}

variable "private_subnet_a_cidr" {
  # default="10.0.16.0/20"
}

variable "private_subnet_b_cidr" {
  # default="10.0.32.0/20"
}

variable "availability_zone" {
  type = map(string)
  default = {
      "az_a"  = "eu-west-1a"
      "az_b"  = "eu-west-1b"
      "az_c"  = "eu-west-1c"
  }
}
