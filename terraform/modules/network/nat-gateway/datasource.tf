data "aws_subnet" "get_subnet" {
  tags = {
    Name = var.subnet
  }
}
#data "aws_eip" "get_eip" {
#  public_ip = ""
#  tags = {
#    Name = var.eip
#  }
#}