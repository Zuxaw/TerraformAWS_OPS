resource "aws_instance" "development_webserver" {

    subnet_id = var.public_subnets_ids[0]

    ami           = "ami-0b5eea76982371e91"
    instance_type = "t2.micro"
    associate_public_ip_address = true

    vpc_security_group_ids = [aws_security_group.sg_ec2.id]

    tags = {
        Name = "development_webserver_${var.cfg.env}"
    }

    user_data = <<EOF
#!/bin/bash
sudo yum -y update
sudo yum -y install httpd
sudo systemctl enable httpd
sudo systemctl start httpd
# Get the instance ID
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

# Print the instance ID to the website
sudo touch /var/www/html/index.html
sudo echo "Instance ID: $INSTANCE_ID" > /var/www/html/index.html
    EOF

}