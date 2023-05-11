resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidr_blocks)

  cidr_block = element(var.private_subnet_cidr_blocks, count.index)
  vpc_id     = aws_vpc.main.id
  availability_zone = element(var.availability_zones, count.index)

#  tags = {
#    Name = "Private Subnet ${count.index + 1}"
#  }

  tags       = merge(
    var.tags,
    {
      Name = format("%s-private-%02d", var.name_prefix, count.index + 1)
    }
  )

}