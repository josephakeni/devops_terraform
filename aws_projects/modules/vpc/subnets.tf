############################################
#           PUBLIC SUBNETS                 #
############################################
resource "aws_subnet" "public_subnet_a" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.public_subnet_a_cidr}"
  availability_zone="${var.availability_zone["az_a"]}"
  map_public_ip_on_launch="true"

  tags = {
    Name = "public_subnet_a"
  }
}

resource "aws_subnet" "public_subnet_b" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.public_subnet_b_cidr}"
  availability_zone="${var.availability_zone["az_b"]}"
  map_public_ip_on_launch="true"

  tags = {
    Name = "public_subnet_b"
  }
}

resource "aws_subnet" "public_subnet_c" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.public_subnet_c_cidr}"
  availability_zone="${var.availability_zone["az_c"]}"
  map_public_ip_on_launch="true"

  tags = {
    Name = "public_subnet_c"
  }
}

############################################
#           PRIVATE SUBNET                 #
############################################

resource "aws_subnet" "private_subnet_a" {
  vpc_id     = "${aws_vpc.main.id}"
  /*
  First IP	10.0.16.0
  Last IP	10.0.31.255
  Total Host	4096
  */
  cidr_block = "${var.private_subnet_a_cidr}"
  availability_zone="${var.availability_zone["az_a"]}"

  tags = {
    Name = "private_subnet_a"
  }
}

resource "aws_subnet" "private_subnet_b" {
  vpc_id     = "${aws_vpc.main.id}"
  /*
  First IP	10.0.32.0
  Last IP	10.0.47.255
  Total Host	4096
  */
  cidr_block = "${var.private_subnet_b_cidr}"
  availability_zone="${var.availability_zone["az_b"]}"

  tags = {
    Name = "private_subnet_b"
  }
}