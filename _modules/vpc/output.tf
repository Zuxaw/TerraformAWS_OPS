output vpc_id {
  value = aws_vpc.vpc_main.id
}

output private_subnets_ids {
  value = aws_subnet.private_subnets[*].id
}

output public_subnets_ids {
  value = aws_subnet.public_subnets[*].id
}

output nat_ip_address {
  value = aws_nat_gateway.main[0].public_ip
}
