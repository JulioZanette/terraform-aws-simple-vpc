resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidr_blocks)

  cidr_block = element(var.public_subnet_cidr_blocks, count.index)
  vpc_id     = aws_vpc.main.id
  map_public_ip_on_launch = true
  availability_zone = element(var.availability_zones, count.index)

#  tags = {
#    Name = "Public Subnet ${count.index + 1}"
#  }

  tags       = merge(
    var.tags,
    {
      Name = format("%s-public-%02d", var.name_prefix, count.index + 1)
    }
  )
}