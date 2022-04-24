module "roles" {
  source = "../modules/roles"
}

module "ecs-lbsg" {
  source        = "../modules/securityGroups"
  aws_vpc_main  = data.terraform_remote_state.network.outputs.main_vpc_id
  name          = "ecs-lbsg"
  description   = "Allow traffic to KAFKA from instances"
  ingress_rules = var.ingress_rules
}

module "ecs-fargate" {
  source                               = "../modules/ecs-fargate"
  aws_vpc_main                         = data.terraform_remote_state.network.outputs.main_vpc_id
  subnets                              = [data.terraform_remote_state.network.outputs.public_subnets[0], data.terraform_remote_state.network.outputs.public_subnets[1]]
  security_groups                      = [module.ecs-lbsg.sg_id]
  app_name                             = "jotonia-fargate"
  container_name                       = "jotonia"
  network_mode                         = "awsvpc"
  launch_type                          = "FARGATE"
  execution_role_arn                   = module.roles.ecs_task_execution_role              #"arn:aws:iam::399839753928:role/ecsTaskExecutionRole" #module.roles.ecs_task_role
  ecs_container_service_autoscale_role = module.roles.ecs_container_service_autoscale_role #"arn:aws:iam::399839753928:role/ecsEC2ContainerServiceAutoscaleRole" #module.roles.ecs_container_service_autoscale_role
  target_type                          = "ip"
  app_image                            = "jakeni/jotonia-app:myapp1"
}

module "ecs-ec2" {
  source               = "../modules/ecs-ec2"
  security_groups      = [module.ecs-lbsg.sg_id] #[data.terraform_remote_state.network.outputs.ecs-lbsg]
  subnets              = [data.terraform_remote_state.network.outputs.public_subnets[0], data.terraform_remote_state.network.outputs.public_subnets[1]]
  aws_vpc_main         = data.terraform_remote_state.network.outputs.main_vpc_id
  container_name       = "jotonia"
  ecs_cluster_name     = "jotonia-ec2"
  launch_type          = "EC2"
  execution_role_arn   = module.roles.ecs_task_execution_role #"arn:aws:iam::399839753928:role/ecsTaskExecutionRole" #module.roles.ecs_task_role
  network_mode         = "bridge"
  iam_instance_profile = "TundeSSMRole"
  instance_type        = "t2.micro"
  key_name             = "cloud1a"
}
