resource "aws_subnet" "public_subnets" {
    count = length(var.subnets_azs)
    vpc_id = aws_vpc.vpc_main.id
    cidr_block = cidrsubnet(aws_vpc.vpc_main.cidr_block, 8, count.index)
    availability_zone = var.subnets_azs[count.index]
}