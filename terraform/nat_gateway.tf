resource "aws_eip" "ngw_eip" {
  domain = "vpc"

  tags = {
    "Name" = "${local.project}-ngw-eip"
  }
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.ngw_eip.id
  subnet_id     = aws_subnet.public_zone1.id

  tags = {
    "Name" = "${local.project}-ngw"
  }

  depends_on = [aws_internet_gateway.igw]
}