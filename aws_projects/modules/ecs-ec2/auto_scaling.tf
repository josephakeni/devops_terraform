resource "aws_launch_configuration" "as_conf" {
  associate_public_ip_address = true
  name_prefix   = "lauch-configuration-"
  image_id      = data.aws_ami.default.id #"ami-0c21ebd9e0dbd6249" 
  iam_instance_profile = "TundeSSMRole"
  instance_type = "t2.micro"
   key_name                    = "cloud1a"
   security_groups          = ["sg-0efcf73e89f94bb3f"]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "bar" {
  vpc_zone_identifier = ["subnet-0ac69f1371d908fc8"]
  name                 = "terraform-asg-example"
  launch_configuration = aws_launch_configuration.as_conf.name
  min_size             = 1
  max_size             = 2
  health_check_grace_period = 300
    health_check_type         = "EC2"

  lifecycle {
    create_before_destroy = true
  }
}