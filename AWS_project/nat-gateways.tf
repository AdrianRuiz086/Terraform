# Resource: aws_nat_gateway
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway

resource "aws_nat_gateway" "gw1" {
  # Provide the alloacation ID of the Elastic IP address for the gateway.
  allocation_id = aws_eip.nat1.id

  # The subnet ID of the subnet in which to place gateway
  subnet_id = aws_subnet.public_subnet.id

  #Tag assigned to NAT
  tags = {
    Name = "NAT 1"
  }
}