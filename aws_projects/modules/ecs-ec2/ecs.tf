resource "aws_ecs_cluster" "main" {
  name = "KKecs-ec2-cluster"
}

data "template_file" "ec2_cb_app" {
  template = file("../../templates/ecs/ec2_cb_app.json.tpl")

  # vars = {
  #   app_image      = var.app_image
  #   app_port       = var.app_port
  #   cpu_size    = var.cpu_size
  #   memory_size = var.memory_size
  #   aws_region     = var.aws_region
  #   network_mode = var.network_mode
  #   container_name = var.container_name
  # }
}

resource "aws_ecs_task_definition" "app" {
  family                   = "ec2_cb_-app-task"
  container_definitions    = data.template_file.ec2_cb_app.rendered
}

resource "aws_ecs_service" "main" {
  name            = "ec2_cb_app-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = 2 #var.app_count
}