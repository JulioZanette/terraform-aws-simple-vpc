output "vpc_id" {
  description = "The ID of the VPC that was created"
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "A list of the IDs of the public subnets that were created"
  value = try(aws_subnet.public[0].id, [])
}

output "private_subnet_ids" {
  description = "A list of the IDs of the private subnets that were created"
  value = try(aws_subnet.private[0].id, [])
}

output "security_group_id" {
  description = "The ID of the default security group that was created"
  value = try(aws_security_group.public[0].id, "")
}
