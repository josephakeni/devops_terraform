####################################
#  ROUTE TABLES                    #
####################################
resource "aws_route_table" "public_route_table" {
  vpc_id = "${aws_vpc.main.id}"
  route {
    /* IP routing is destination based. 
    The destination must be an IP prefix in CIDR notaion e.g 0.0.0.0/0 */
    # cidr_block = Destionation.
    cidr_block = "0.0.0.0/0"
    /* The target must be an AWS network resource such as 
    internet gateway or Elastic Network Interface */
    # gateway_id= Target
    gateway_id = "${aws_internet_gateway.main_igw.id}"
  }

  tags = {
    Name = "public_route_table"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = "${aws_vpc.main.id}"
  # route {
  #   /* IP routing is destination based. 
  #   The destination must be an IP prefix in CIDR notaion e.g 0.0.0.0/0 */
  #   # cidr_block = Destionation.
  #   cidr_block = "0.0.0.0/0"
  #   /* The target must be an AWS network resource such as 
  #   internet gateway or Elastic Network Interface */
  #   # gateway_id= Target
  #   gateway_id = "${aws_nat_gateway.nat_gw.id}"
  # }

  tags = {
    Name = "private_route_table"
  }
}

####################################
#  ROUTE TABLE ASSOCIATION PUBLIC  #
####################################
/*
If you do not explicitly associate a subnet with a route table 
you created, AWS will implicitly associate it with the main route table
*/
resource "aws_route_table_association" "main_public_1_a" {
  subnet_id      = "${aws_subnet.public_subnet_a.id}"
  route_table_id = "${aws_route_table.public_route_table.id}"
}

resource "aws_route_table_association" "main_public_1_b" {
  subnet_id      = "${aws_subnet.public_subnet_b.id}"
  route_table_id = "${aws_route_table.public_route_table.id}"
}

resource "aws_route_table_association" "main_public_1_c" {
  subnet_id      = "${aws_subnet.public_subnet_c.id}"
  route_table_id = "${aws_route_table.public_route_table.id}"
}

resource "aws_route_table_association" "main_private_1_a" {
  subnet_id      = "${aws_subnet.private_subnet_a.id}"
  route_table_id = "${aws_route_table.private_route_table.id}"
}

resource "aws_route_table_association" "main_private_1_b" {
  subnet_id      = "${aws_subnet.private_subnet_b.id}"
  route_table_id = "${aws_route_table.private_route_table.id}"
}