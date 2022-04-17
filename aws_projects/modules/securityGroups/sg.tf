# ALB Security Group: Edit to restrict access to the application
resource "aws_security_group" "sg" {
  name        = "${var.name}"
  description = var.description #"controls access to the ALB"
  vpc_id   = "${var.aws_vpc_main}"

  ingress {
    protocol    = "tcp"
    from_port   = var.ingress_from_port
    to_port     = var.ingress_to_port
    cidr_blocks = ["${var.ingress_cidr_blocks}"] 
  }

  egress {
    protocol    = "${var.protocol}"
    from_port   = var.egress_from_port
    to_port     = var.egress_to_port
    cidr_blocks = ["${var.egress_cidr_blocks}"]
  }

  tags ={
        Name = var.name
    }
}

# # Traffic to the ECS cluster should only come from the ALB
# resource "aws_security_group" "ecs_tasks" {
#   name        = "cb-ecs-tasks-security-group"
#   description = "allow inbound access from the ALB only"
#   vpc_id      = aws_vpc.main.id

#   ingress {
#     protocol        = "tcp"
#     from_port       = var.app_port
#     to_port         = var.app_port
#     security_groups = [aws_security_group.lb.id]
#   }

#   egress {
#     protocol    = "-1"
#     from_port   = 0
#     to_port     = 0
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }