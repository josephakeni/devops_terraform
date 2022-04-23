module "roles" {
  source = "../modules/roles"
}

module "ecs-fargate" {
  source = "../modules/ecs-fargate"
  aws_vpc_main = data.terraform_remote_state.network.outputs.main_vpc_id
  subnets = [data.terraform_remote_state.network.outputs.public_subnets[0], data.terraform_remote_state.network.outputs.public_subnets[1]]
  security_groups = [data.terraform_remote_state.network.outputs.ecs-lbsg]
  app_name = "jotonia-fargate"
  container_name = "jotonia"
  network_mode = "awsvpc"
  launch_type = "FARGATE"
  execution_role_arn = "arn:aws:iam::399839753928:role/ecsTaskExecutionRole" #module.roles.ecs_task_role
  ecs_container_service_autoscale_role = "arn:aws:iam::399839753928:role/ecsEC2ContainerServiceAutoscaleRole" #module.roles.ecs_container_service_autoscale_role
  target_type = "ip"
  app_image = "jakeni/jotonia-app:myapp1"
}

module "ecs-ec2" {
  source = "../modules/ecs-ec2"
}
