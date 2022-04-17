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

module "security_groups" {
  source              = "../modules/securityGroups"
  aws_vpc_main        = data.terraform_remote_state.network.outputs.main_vpc_id
  name                = "cb-load-security-group"
  description         = "controls access to the ALB"
  ingress_from_port   = 3000
  ingress_to_port     = 3000
  egress_from_port    = 0
  egress_to_port      = 0
  ingress_cidr_blocks = "0.0.0.0/0"
  egress_cidr_blocks  = "0.0.0.0/0"
  protocol            = "-1"
}

# module "tunde_sg" {
#   source = "../modules/securityGroups"
#   aws_vpc_main = data.terraform_remote_state.network.outputs.main_vpc_id 
#   name = "tunde-load-security-group" 
#   description = "controls access to the ALB"
#   ingress_from_port = 3000 
#   ingress_to_port = 3000
#   egress_from_port = 0 
#   egress_to_port = 0
#   ingress_cidr_blocks = "0.0.0.0/0" 
#   egress_cidr_blocks = "0.0.0.0/0"
#   protocol = "-1"
# }


#module "alb" {
#  source       = "../modules/alb"
#  aws_vpc_main = data.terraform_remote_state.network.outputs.main_vpc_id
#  subnet_id    = [data.terraform_remote_state.network.outputs.public_subnet_a_id, data.terraform_remote_state.network.outputs.public_subnet_b_id]
#  main_sg_id   = data.terraform_remote_state.network.outputs.main_sg_id
#  name         = "prod-alb"
#}

#module "dev_alb" {
#  source       = "../modules/alb"
#  aws_vpc_main = data.terraform_remote_state.network.outputs.main_vpc_id
#  subnet_id    = [data.terraform_remote_state.network.outputs.public_subnet_a_id, data.terraform_remote_state.network.outputs.public_subnet_b_id]
#  main_sg_id   = data.terraform_remote_state.network.outputs.main_sg_id
#  name         = "dev-alb"
#}
