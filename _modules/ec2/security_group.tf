resource "aws_security_group" "sg_ec2" {
  name        = "ec2-public"
  description = "Allow HTTP inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [var.cfg.vpc.cidr]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "sg_ec2_${var.cfg.env}"
  }
}
