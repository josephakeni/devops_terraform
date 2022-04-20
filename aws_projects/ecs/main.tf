module "ecs" {
  source = "../modules/ecs"
  aws_vpc_main = data.terraform_remote_state.network.outputs.main_vpc_id
  subnets = [data.terraform_remote_state.network.outputs.public_subnets[0], data.terraform_remote_state.network.outputs.public_subnets[1]]
  security_groups = [data.terraform_remote_state.network.outputs.ecs-lbsg]
  app_name = "jotonia"
  container_name = "cb-app"
}
