output "vpc_id" {
  description = "The ID of the VPC that was created"
  value = module.my_vpc.vpc_id
}

output "public_subnet_ids" {
  description = "A list of the IDs of the public subnets that were created"
  value = module.my_vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "A list of the IDs of the private subnets that were created"
  value = module.my_vpc.private_subnet_ids
}

output "security_group_id" {
  description = "The ID of the default security group that was created"
  value = module.my_vpc.security_group_id
}
