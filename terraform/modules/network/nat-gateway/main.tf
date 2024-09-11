resource "aws_eip" "eip" {
  tags = {
    Name = var.eip
    Owner = var.owner
    path  = path.cwd
  }
}
resource "aws_nat_gateway" "nat" {
  subnet_id     = data.aws_subnet.get_subnet.id
  allocation_id = aws_eip.eip.id
  tags          = {
    Name  = var.nat_gateway
    Owner = var.owner
    path  = path.cwd
  }
}
