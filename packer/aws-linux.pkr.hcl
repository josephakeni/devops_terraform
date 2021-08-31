source "amazon-ebs" "amazon-linux" {
  ami_name      = "task2-packer-amazon-linux"
  instance_type = "t2.micro"
  region        = "eu-west-1"
  source_ami_filter {
    filters = {
      name                = "amzn2-ami-hvm-*-gp2"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["amazon"]
  }
  ssh_username = "ec2-user"
  tags = {
    Name = "task2-packer-amazon-linux"
  }
}

build {
  sources = [
    "source.amazon-ebs.amazon-linux"
  ]

  provisioner "file" {
    source      = "tf-packer.pub"
    destination = "/tmp/"
  }

  provisioner "shell" {
    script = "../scripts/amz_baseline_tools.sh"
  }

}
