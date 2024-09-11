data "aws_vpc" "get_vpc" {
  tags = {
    Name = var.vpc
  }
}
data "aws_nat_gateway" "get_nat_gateway" {
  tags = {
    Name = var.nat_gateway
  }
}