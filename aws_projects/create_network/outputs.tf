output "main_vpc_id" {
  value = module.main_vpc.main_vpc_id
}

output "private_subnets" {
  value = module.main_vpc.private_subnets
}

output "public_subnets" {
  value = module.main_vpc.public_subnets
}

output "internet_gateway_id" {
  value = module.main_vpc.internet_gateway_id
}

output "main_sg_id" {
  value = module.main_vpc.main_sg_id
}

output "sg_id" {
  value = module.security_groups.sg_id
}

# output "tunde_sg" {
#   value = module.tunde_sg.sg_id
# }

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

output "main_public_ids" {
  value = module.main_vpc.main_public_ids
}

output "main_private_ids" {
  value = module.main_vpc.main_private_ids
}
