##########################
### Public route table ###
##########################
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc_main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "rt-public_${var.cfg.env}"
  }
}

resource "aws_route_table_association" "public" {
  count = length(aws_subnet.public_subnets)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public.id
}


##########################
### Private route table ###
##########################
resource "aws_route_table" "private" {
  # check if deploying the nat gateway
  count = var.cfg.vpc.deploy_nat_gw ? 1 : 0

  vpc_id = aws_vpc.vpc_main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.main[0].id
  }

  tags = {
    Name = "rt-private"
  }
}

resource "aws_route_table_association" "private" {
  count = var.cfg.vpc.deploy_nat_gw ? length(aws_subnet.private_subnets) : 0
  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private[0].id
}