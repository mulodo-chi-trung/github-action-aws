variable "project" {}
variable "multi_az" {
  default = false
}
variable "rds" {
  default = false
}
variable "nat_mode" {
  // TODO allow to disable creation of any type nat
  description = "Could be 'gateway' or 'instance', read more: https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/vpc-nat-comparison.html"
  default     = "instance"
}

locals {
  nat_instance          = "${var.nat_mode == "gateway" ? false : true}"
  nat_instance_multi_az = "${local.nat_instance == false ? false : var.multi_az}"

  nat_gw          = "${var.nat_mode == "gateway" ? true : false}"
  nat_gw_multi_az = "${local.nat_gw == false ? false : var.multi_az}"
}

variable "nat_instance_type" {
  default = "t2.micro"
}

variable "private_subnet_cidr" {
  description = "cidr of private subnet"
  default     = "10.20.0.0/24"
}

variable "public_subnet_cidr" {
  description = "cidr of public subnet"
  default     = "10.20.1.0/24"
}

variable "vpc_cidr" {
  description = "cidr of vpc"
  default     = "10.20.0.0/16"
}