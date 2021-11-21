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

module "alb" {
  source = "../modules/alb"
  aws_vpc_main = data.terraform_remote_state.network.outputs.main_vpc_id
  subnet_id        = [data.terraform_remote_state.network.outputs.public_subnet_a_id, data.terraform_remote_state.network.outputs.public_subnet_b_id]
  main_sg_id       = data.terraform_remote_state.network.outputs.main_sg_id
  name = "prod-alb"
}

module "dev_alb" {
  source = "../modules/alb"
  aws_vpc_main = data.terraform_remote_state.network.outputs.main_vpc_id
  subnet_id        = [data.terraform_remote_state.network.outputs.public_subnet_a_id, data.terraform_remote_state.network.outputs.public_subnet_b_id]
  main_sg_id       = data.terraform_remote_state.network.outputs.main_sg_id
  name = "dev-alb"
}
