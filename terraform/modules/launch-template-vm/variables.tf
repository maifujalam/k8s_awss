variable "region" {
  description = "Region"
}
variable "owner" {
  default = "skalam"
}
variable "launch_template" {
  default = "bastion-ubuntu-2404"
}
variable "instance_name" {
  default = "default-instance"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "vm_count" {
  default = "1"
}
variable "enable_public_ip" {
  default = "true"
  description = "Whether it is public vm or private vm"
}
variable "root_volume_size" {
  description = "Size of root volume"
}
variable "spot_instance" {
  default = false
}
variable "subnet_name" {
  default = "subnet-1"
}
variable "vpc_name" {
  default = "default"
}
