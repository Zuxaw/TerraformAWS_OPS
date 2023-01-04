#####################
#### NAT Gateway ####
#####################
resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "main" {
  # check if deploying the nat gateway
  count = var.cfg.vpc.deploy_nat_gw ? 1 : 0

  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_subnets[count.index].id # arbitrary selected

  tags = {
    Name = "NAT-Gateway-${var.cfg.env}"
  }

}