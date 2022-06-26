# create VPC
resource "aws_vpc" "flask-vpc" {
  cidr_block            = var.vpc_cidr
  enable_dns_hostnames  = true
  enable_dns_support    = true

  tags = {
    Name = "flask-vpc"
  }
}