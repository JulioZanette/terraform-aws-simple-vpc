resource "aws_security_group" "public" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port = 0
    to_port   = 65535
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  count = length(var.public_subnet_cidr_blocks)

#  tags = {
#    Name = "Public Security Group ${count.index + 1}"
#  }
  tags        = merge(
    var.tags,
    {
      Name = format("%s-allow-all-sg-%d", var.name_prefix, count.index + 1)
    }
  )
}