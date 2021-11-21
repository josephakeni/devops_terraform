
#variable "instance_count" {}

#variable "ami_id" {}

#variable "instance_type" {
#  default = "t2.micro"
#}

variable "subnet_id" {}

variable "main_sg_id" {}
 
variable "aws_vpc_main" {} 

#variable "my_private_key"{
#    // This is where the private key is stored on the local machine
#    default= "~/.ssh/cloud1a.pem"
#}

variable "name" {}
#variable "environment" {}
#variable "role" {}