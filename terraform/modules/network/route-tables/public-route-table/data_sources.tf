data "aws_vpc" "get_vpc" {
  tags = {
    Name = var.vpc
  }
}
data "aws_internet_gateway" "get_ig" {
  tags = {
    Name = var.internet_gateway
  }
}