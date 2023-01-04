resource "aws_subnet" "public_subnets" {
  count = length(var.cfg.vpc.subnets_azs)
  vpc_id = aws_vpc.vpc_main.id
  cidr_block = var.cfg.vpc.subnets.public.cidrs[count.index]
  availability_zone = var.cfg.vpc.subnets_azs[count.index]

  # TODO tags
  tags = {
    Name = "public_subnet"
  }
}