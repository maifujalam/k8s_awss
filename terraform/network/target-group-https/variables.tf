variable "region" {
  description = "Region"
}
variable "owner" {
  default = "skalam"
}
variable "project" {
  default = "k8s_aws"
}
variable "name" {
  default = "default-tg"
}
variable "port" {
  default = 80
}
variable "vpc_name" {
  description = "VPC Name"
  default     = "default"
}
variable "protocol" {
  default = "HTTP"
}
variable "health_check_path" {
  default = "/healthz"
}
