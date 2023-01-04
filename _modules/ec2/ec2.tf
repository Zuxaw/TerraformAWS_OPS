resource "aws_instance" "staging_webserver" {
    count = length(var.private_subnets_ids)

    subnet_id = var.private_subnets_ids[count.index]

    ami           = "ami-0b5eea76982371e91"
    instance_type = "t2.micro"
    associate_public_ip_address = false

    vpc_security_group_ids = [aws_security_group.private.id]

    tags = {
        Name = "webserver_${var.cfg.env}"
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