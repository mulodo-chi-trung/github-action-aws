provider "aws" {
  # region     = "us-east-2"
  # access_key = "AKIAXQAG5RWJ3RAX4DLO"
  # secret_key = "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"
}

resource "aws_vpc" "project" {
  cidr_block           = "10.20.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "${var.project}"
  }
}

# private subnet #1
resource "aws_subnet" "private_app_1" {
  cidr_block        = "10.20.4.0/24"
  vpc_id            = "${aws_vpc.project.id}"
  availability_zone = "us-east-2a"
  tags = {
    Name       = "Private Subnet"
    Visibility = "Private"
  }
}

# public subnet #1 for NAT gw
resource "aws_subnet" "public_nat_1" {
  cidr_block        = "10.20.5.0/24"
  vpc_id            = "${aws_vpc.project.id}"
  availability_zone = "us-east-2a"

  tags = {
    Name       = "Public Subnet"
    Visibility = "Public"
  }
}