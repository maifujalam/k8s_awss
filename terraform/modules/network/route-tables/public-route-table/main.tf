resource "aws_route_table" "rt-public" {
  vpc_id = data.aws_vpc.get_vpc.id
  tags = {
    Name = var.route_table
    Owner = var.owner
    Path  = path.cwd
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = data.aws_internet_gateway.get_ig.id
  }
}