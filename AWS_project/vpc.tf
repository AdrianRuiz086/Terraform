# Resource "aws_vpc" "main"
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  # Tags to assign to the resource

  tags = {
    Name = "main"
  }

}

