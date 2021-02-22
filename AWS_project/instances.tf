# Resource: aws_instance
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
# Private EC2 Instance 
resource "aws_instance" "private-instance" {
  ami                    = "ami-047a51fa27710816e"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1"
  subnet_id              = aws_subnet.private_subnet.id
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]
  key_name               = "MyUSE1KP"

  user_data = <<-EOF
		#! /bin/bash
		sudo yum install nginx -y
		sudo systemctl start nginx.service 
		sudo systemctl enable nginx.service 
		EOF

  # Tag assigned to the EC2 intance
  tags = {
    Name = "private-intance"
  }
}

# Private EC2 Instance 
resource "aws_instance" "public-instance" {
  ami                    = "ami-047a51fa27710816e"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1"
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]
  key_name               = "MyUSE1KP"


  # Tag assigned to the EC2 intance
  tags = {
    Name = "public-intance"
  }
}