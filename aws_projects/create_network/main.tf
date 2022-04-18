provider "aws" {
  region = var.region
  #profile = "${var.profile}"
}

module "main_vpc" {
  source              = "../modules/vpc"
  main_vpc_cidr_block = var.main_vpc_cidr_block
  tenancy             = var.tenancy
  private_subnets     = var.private_subnets
  name                = var.name
  public_subnets      = var.public_subnets
  environment         = var.environment
  availability_zones  = var.availability_zones
}

module "kafka_sg" {
  source              = "../modules/securityGroups"
  aws_vpc_main        = data.terraform_remote_state.network.outputs.main_vpc_id
  name                = "kafka_sg"
  description         = "Allow traffic to KAFKA from instances"
  ingress_rules = var.ingress_rules
  
}

#module "alb" {
#  source       = "../modules/alb"
#  aws_vpc_main = data.terraform_remote_state.network.outputs.main_vpc_id
#  subnet_id    = [data.terraform_remote_state.network.outputs.public_subnet_a_id, data.terraform_remote_state.network.outputs.public_subnet_b_id]
#  main_sg_id   = data.terraform_remote_state.network.outputs.main_sg_id
#  name         = "prod-alb"
#}