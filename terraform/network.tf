# create VPC
resource "aws_vpc" "flask-vpc" {
  cidr_block            = var.vpc_cidr
  enable_dns_hostnames  = true
  enable_dns_support    = true

  tags = {
    Name = "flask-vpc"
  }
}

# create an IGW (so resources can talk to the internet)
resource "aws_internet_gateway" "flask-igw" {
  vpc_id = aws_vpc.flask-vpc.id

  tags = {
    Name = "flask-vpc"
  }
}