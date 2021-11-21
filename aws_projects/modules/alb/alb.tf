resource "aws_lb" "test" {
  name               = "${var.name}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${var.main_sg_id}"]
  subnets            =  "${var.subnet_id}"

  enable_deletion_protection = false

  #access_logs {
  #  bucket = "cloudpart1buk1"
  #  #bucket  = aws_s3_bucket.lb_logs.bucket
  #  prefix  = "test-lb"
  #  enabled = true
  #}

  tags = {
    Environment = "${var.name}"
  }
}