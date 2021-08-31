output "main_vpc_id" {
  value = module.main_vpc.main_vpc_id
}

output "private_subnet_a_id" {
  value = module.main_vpc.private_subnet_a_id
}

output "private_subnet_b_id" {
  value = module.main_vpc.private_subnet_b_id
}

output "public_subnet_a_id" {
  value = module.main_vpc.public_subnet_a_id
}

output "public_subnet_b_id" {
  value = module.main_vpc.public_subnet_b_id
}

output "public_subnet_c_id" {
  value = module.main_vpc.public_subnet_c_id
}

output "internet_gateway_id" {
  value = module.main_vpc.internet_gateway_id
}

output "main_sg_id" {
  value = module.main_vpc.main_sg_id
}

output "splunk_sg_id" {
  value = module.main_vpc.splunk_sg_id
}

output "kafka_sg_id" {
  value = module.main_vpc.kafka_sg_id
}

output "zookeeper_sg_id" {
  value = module.main_vpc.zookeeper_sg_id
}
output "monitor_sg_id" {
  value = module.main_vpc.monitor_sg_id
}

# output "nat_eip_id" {
#   value = "${module.main_vpc.nat_eip_id}"
# }

# output "nat_gw_id" {
#   value = "${module.main_vpc.nat_gw_id}"
# }

output "public_route_table_id" {
  value = module.main_vpc.public_route_table_id
}

output "private_route_table_id" {
  value = module.main_vpc.private_route_table_id
}

output "main_public_1_a_id" {
  value = module.main_vpc.main_public_1_a_id
}
output "main_public_1_b_id" {
  value = module.main_vpc.main_public_1_b_id
}

output "main_public_1_c_id" {
  value = module.main_vpc.main_public_1_c_id
}

output "main_private_1_a_id" {
  value = module.main_vpc.main_private_1_a_id
}
output "main_private_1_b_id" {
  value = module.main_vpc.main_private_1_b_id
}
