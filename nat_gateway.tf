resource "aws_eip" "nat" {
  count = var.enable_nat_gateway ? 1 : 0

#  # Skip creation if eip is empty or disabled
  lifecycle {
#    ignore_changes = [
#      "depends_on",
#      "self.associate_with_private_ip",
#      "self.instance"
#    ]

    create_before_destroy = true

#    prevent_destroy = var.enable_nat_gateway ? false : true
  }

  tags = var.tags

  vpc = true
}

resource "aws_nat_gateway" "nat" {
  count = var.enable_nat_gateway ? 1 : 0
#  count = length(var.public_subnet_cidr_blocks)

  allocation_id = aws_eip.nat[count.index[*]].id
  subnet_id     = aws_subnet.public[count.index].id
}