resource "aws_route_table" "rt-private" {
  vpc_id = data.aws_vpc.get_vpc.id
  tags = {
    Name = var.route_table
    Owner = var.owner
    Path  = path.cwd
  }
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = data.aws_nat_gateway.get_nat_gateway.id
  }
}