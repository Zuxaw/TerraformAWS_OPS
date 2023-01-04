#####################
#### NAT Gateway ####
#####################
resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "main" {

  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_subnets[0].id # arbitrary selected

  tags = {
    Name = "NAT-Gateway-${var.cfg.env}"
  }

}