# Resource: aws_route_table
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table

resource "aws_route_table_association" "public" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.public_subnet.id

  # The ID of the associated routing table
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.private_subnet.id

  # The ID of the associated routing table
  route_table_id = aws_route_table.private.id
}