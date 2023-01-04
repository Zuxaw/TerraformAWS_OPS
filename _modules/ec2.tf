resource "aws_instance" "development_webserver" {

    subnet_id = var.public_subnets_ids[0]

    ami           = "ami-0b0dcb5067f052a63"
    instance_type = "t2.micro"
    associate_public_ip_address = false

    vpc_security_group_ids = [aws_security_group.public.id]

    user_data = <<EOF
    #!/bin/bash
    yum -y update
    yum -y install httpd
    systemctl enable httpd
    systemctl start httpd
    # Get the instance ID
    INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

    # Print the instance ID to the website
    echo "Instance ID: $INSTANCE_ID" > /var/www/html/index.html
    EOF

}