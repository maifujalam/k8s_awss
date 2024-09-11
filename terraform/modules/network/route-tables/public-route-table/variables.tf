variable "region" {
  description = "Region"
}
variable "vpc" {
  description = "VPC Name"
  default = "default-vpc"
}
variable "internet_gateway" {
  description = "Internet Gateway name"
}
variable "route_table" {
  description = "Route Table Name"
}
variable "owner" {
  description = "Owner of the module"
}