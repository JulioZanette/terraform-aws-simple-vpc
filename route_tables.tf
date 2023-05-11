resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  count = length(var.public_subnet_cidr_blocks)

#  tags = {
#    Name = "Public Route Table ${count.index + 1}"
#  }

  tags   = merge(
    var.tags,
    {
      Name = format("%s-public-rt-%d", var.name_prefix, count.index + 1)
    }
  )
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  count = length(var.private_subnet_cidr_blocks)

#  tags = {
#    Name = "Private Route Table ${count.index + 1}"
#  }
  tags   = merge(
    var.tags,
    {
      Name = format("%s-private-rt-%d", var.name_prefix, count.index + 1)
    }
  )
}

resource "aws_route" "nat_gateway" {
#  count = length(var.private_subnet_cidr_blocks)
  count = var.enable_nat_gateway ? 1 : 0

  route_table_id         = aws_route_table.private[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat[count.index].id
}