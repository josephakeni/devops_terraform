############################################
#           VPC RESOURCE OUTPUT            #
############################################

output "main_vpc_id" {
  value = "${aws_vpc.main.id}"
}

output "public_subnet_a_id" {
  value = "${aws_subnet.public_subnet_a.id}"
}

output "public_subnet_b_id" {
  value = "${aws_subnet.public_subnet_b.id}"
}

output "public_subnet_c_id" {
  value = "${aws_subnet.public_subnet_c.id}"
}

output "private_subnet_a_id" {
  value = "${aws_subnet.private_subnet_a.id}"
}

output "private_subnet_b_id" {
  value = "${aws_subnet.private_subnet_b.id}"
}

output "internet_gateway_id" {
  value = "${aws_internet_gateway.main_igw.id}"
}

output "main_sg_id" {
  value = "${aws_security_group.main_sg.id}"
}

output "splunk_sg_id" {
  value = "${aws_security_group.splunk_sg.id}"
}

output "kafka_sg_id" {
  value = "${aws_security_group.kafka_sg.id}"
}

output "zookeeper_sg_id" {
  value = "${aws_security_group.zookeeper_sg.id}"
}

# output "nat_eip_id" {
#   value = "${aws_eip.nat.id}"
# }

# output "nat_gw_id" {
#   value = "${aws_nat_gateway.nat_gw.id}"
# }

output "public_route_table_id" {
  value = "${aws_route_table.public_route_table.id}"
}

output "private_route_table_id" {
  value = "${aws_route_table.private_route_table.id}"
}

output "main_public_1_a_id" {
  value = "${aws_route_table_association.main_public_1_a.id}"
}
output "main_public_1_b_id" {
  value = "${aws_route_table_association.main_public_1_b.id}"
}

output "main_public_1_c_id" {
  value = "${aws_route_table_association.main_public_1_c.id}"
}

output "main_private_1_a_id" {
  value = "${aws_route_table_association.main_private_1_a.id}"
}
output "main_private_1_b_id" {
  value = "${aws_route_table_association.main_private_1_b.id}"
}
