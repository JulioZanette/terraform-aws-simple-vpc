resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

#  tags = {
#    Name = "Main IGW"
#  }

  tags   = merge(
    var.tags,
    {
      Name = format("%s-igw", var.name_prefix)
    }
  )
}
