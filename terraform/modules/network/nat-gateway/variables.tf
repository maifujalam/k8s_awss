variable "subnet" {
  description = "Subnet Name"
}
variable "nat_gateway" {
  description = "NAT Gateway name"
}
variable "owner" {
  description = "Owner Name"
}
variable "eip" {
  description = "Default EIP ID"
  default = "default-elasic-ip"
}
