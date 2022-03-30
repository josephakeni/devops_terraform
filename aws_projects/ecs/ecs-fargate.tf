resource "aws_ecs_cluster" "cluster" {
  name = var.name

  setting {
    name  = "containerInsights"
    value = "disabled" #"enabled"
  }
}
terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
    }
  }
}

resource "aws_ecs_task_definition" "main" {
  family                   = "${var.name}-task-${var.environment}"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_role.arn
  container_definitions = jsonencode([{
    name        = "${var.name}-container-${var.environment}"
    image       = "${var.container_image}:latest"
    essential   = true
   # environment = var.container_environment  #Try to find out
    portMappings = [{
      protocol      = "tcp"
      containerPort = var.container_port
      hostPort      = var.container_port
    }]
  }])
}

resource "aws_ecs_service" "cluster" {
  name            = "mycluster"
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.main.arn
  desired_count   = 1
  # iam_role        = aws_iam_role.foo.arn
  # depends_on      = [aws_iam_role_policy.foo]

  network_configuration {
    subnets = [
      "subnet-08e57b76de6f6ed39",
      "subnet-05ce96e3ad611a35f",
      "subnet-09957f0e1e8a4c570"
    ]
    security_groups = [
      "sg-0d8c71d604117e188"
    ]
    assign_public_ip = "false"
  }
  
  # ordered_placement_strategy {
  #   type  = "binpack"
  #   field = "cpu"
  # }

  # load_balancer {
  #   target_group_arn = aws_lb_target_group.foo.arn
  #   container_name   = "mongo"
  #   container_port   = 8080
  # }

  # placement_constraints {
  #   type       = "memberOf"
  #   expression = "attribute:ecs.availability-zone in [us-west-2a, us-west-2b]"
  # }
}