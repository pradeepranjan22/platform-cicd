data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_vpc" "k8s" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "k8s-lab-vpc"
  }
}

# ---------------------------------------------------------
# Subnet 1 - Availability Zone 1
# ---------------------------------------------------------

resource "aws_subnet" "k8s_az1" {
  vpc_id                  = aws_vpc.k8s.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "k8s-lab-subnet-az1"
  }
}

# ---------------------------------------------------------
# Subnet 2 - Availability Zone 2
# ---------------------------------------------------------

resource "aws_subnet" "k8s_az2" {
  vpc_id                  = aws_vpc.k8s.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "k8s-lab-subnet-az2"
  }
}

# ---------------------------------------------------------
# Internet Gateway
# ---------------------------------------------------------

resource "aws_internet_gateway" "k8s" {
  vpc_id = aws_vpc.k8s.id

  tags = {
    Name = "k8s-lab-igw"
  }
}

# ---------------------------------------------------------
# Route Table
# ---------------------------------------------------------

resource "aws_route_table" "k8s" {
  vpc_id = aws_vpc.k8s.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.k8s.id
  }

  tags = {
    Name = "k8s-lab-route-table"
  }
}

# ---------------------------------------------------------
# Route Table Association - AZ1
# ---------------------------------------------------------

resource "aws_route_table_association" "k8s_az1" {
  subnet_id      = aws_subnet.k8s_az1.id
  route_table_id = aws_route_table.k8s.id
}

# ---------------------------------------------------------
# Route Table Association - AZ2
# ---------------------------------------------------------

resource "aws_route_table_association" "k8s_az2" {
  subnet_id      = aws_subnet.k8s_az2.id
  route_table_id = aws_route_table.k8s.id
}