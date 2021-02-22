# Resource: aws_route_table
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table

resource "aws_route_table" "public" {
  #The VPC ID
  vpc_id = aws_vpc.main.id

  route {
    # The CIDR block of the route 
    cidr_block = "0.0.0.0/0"

    # The internet gateway id
    gateway_id = aws_internet_gateway.main.id

  }

  # The tag to assign to the resource
  tags = {
    Name = "public"
  }
}

resource "aws_route_table" "private" {

  # The VPC ID 
  vpc_id = aws_vpc.main.id

  route {
    # The CIDR block of the route 
    cidr_block = "0.0.0.0/0"

    # The Id of NAT gateway
    nat_gateway_id = aws_nat_gateway.gw1.id

  }

  # Tag to assign to the resource
  tags = {
    Name = "private"
  }

}



