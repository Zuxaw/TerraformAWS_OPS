resource "aws_vpc" "vpc_main" {
  cidr_block = var.cfg.vpc.cidr

  # TODO tags
  tags = {
    Name = "vpc_main_${var.cfg.env}"
  }
}