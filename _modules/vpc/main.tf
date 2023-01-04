resource "aws_vpc" "demo" {
  cidr_block = var.cfg.vpc.cidr
}