# Resource: aws_eip
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip

resource "aws_eip" "nat1" {
  # IGW should have exits aleredy
  depends_on = [aws_internet_gateway.main]
}