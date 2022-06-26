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

# Routing table for the VPC
resource "aws_route_table" "flask-public-route" {
  vpc_id = aws_vpc.flask-vpc.id

  tags = {
    Name = "flask-vpc"
  }
}

# Create count of subnets in each az
resource "aws_subnet" "flask-public-subnets" {
  vpc_id = aws_vpc.flask-vpc.id
  count = 2
  cidr_block = var.subnet_cidrs[count.index]
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.azs.names[count.index]

  tags = {
    Name = "flask-public-${count.index}"
  }
}

# connect subnets with routing table
resource "aws_route_table_association" "flask-route-table-assoc" {
  count = 2
  route_table_id = aws_route_table.flask-public-route.id
  subnet_id = aws_subnet.flask-public-subnets.*.id[count.index]
}

# create security group
resource "aws_security_group" "flask-sg" {
  name = "needs-better-name"
  vpc_id = aws_vpc.flask-vpc.id
}