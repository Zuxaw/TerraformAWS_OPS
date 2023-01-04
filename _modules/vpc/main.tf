resource "aws_vpc" "main_vpc" {
  cidr_block = var.cfg.vpc.cidr

  # TODO tags
  tags = {
    Name = "main_vpc"
  }
}