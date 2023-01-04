########################
### Internet Gateway ###
########################
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.vpc_main.id

  tags = {
    Name = "main_${var.cfg.env}"
  }
}