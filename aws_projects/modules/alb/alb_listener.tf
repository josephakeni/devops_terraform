resource "aws_lb_target_group" "test" {
  name     = "${var.name}-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${var.aws_vpc_main}"
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.test.arn
  port              = "80" #"443"
  protocol          = "HTTP"
#  ssl_policy        = "ELBSecurityPolicy-2016-08"
#  certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test.arn
  }
}