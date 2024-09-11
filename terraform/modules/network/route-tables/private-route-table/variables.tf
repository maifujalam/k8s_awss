variable "region" {
  description = "Region"
}
variable "vpc" {
  description = "VPC Name"
  default = "default-vpc"
}
variable "route_table" {
  description = "Route Table Name"
}
variable "owner" {
  description = "Owner of the module"
}
variable "nat_gateway" {
  description = "NAT Gateway name"
}