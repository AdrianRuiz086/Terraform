# Resource: aws_subnet
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet

resource "aws_subnet" "public_subnet" {
  # The VPC id
  vpc_id = aws_vpc.main.id

  # CIDR block fo the subnet
  cidr_block = "10.0.1.0/24"

  # The AZ for the subnet 
  availability_zone = "us-east-1a"

  # Public IP at launch 
  map_public_ip_on_launch = true

  # Tags for this subnet 
  tags = {
    Name = "public_subnet"

  }

}

resource "aws_subnet" "private_subnet" {
  # The VPC id
  vpc_id = aws_vpc.main.id

  # CIDR block fo the subnet
  cidr_block = "10.0.2.0/24"

  # The AZ for the subnet
  availability_zone = "us-east-1a"

  # Public IP at launch
  map_public_ip_on_launch = "false"

  # Tags for this subnet 
  tags = {
    Name = "private_subnet"

  }

}