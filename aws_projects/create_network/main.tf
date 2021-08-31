provider "aws" {
  region = var.region
  #profile = "${var.profile}"
}

module "main_vpc" {
  source                = "../modules/vpc"
  main_vpc_cidr_block   = var.main_vpc_cidr_block
  tenancy               = var.tenancy
  public_subnet_a_cidr  = var.public_subnet_a_cidr
  public_subnet_b_cidr  = var.public_subnet_b_cidr
  public_subnet_c_cidr  = var.public_subnet_c_cidr
  private_subnet_a_cidr = var.private_subnet_a_cidr
  private_subnet_b_cidr = var.private_subnet_b_cidr
}
