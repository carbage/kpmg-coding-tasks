# Create a VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc.cidr_block
  tags = {
    Name = var.vpc.name
  }
}

# Create Web Public Subnet
resource "aws_subnet" "web-subnet" {
  count = length(var.availability_zones)

  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.web_subnets[count.index].cidr_block
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = var.web_subnets[count.index].name
  }
}


# Create Web Public Subnet
resource "aws_subnet" "app-subnet" {
  count = length(var.availability_zones)

  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.app_subnets[count.index].cidr_block
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = var.app_subnets[count.index].name
  }
}


# Create Web Public Subnet
resource "aws_subnet" "data-subnet" {
  count = length(var.availability_zones)

  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.data_subnets[count.index].cidr_block
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = var.data_subnets[count.index].name
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "Gateway"
  }
}

# Create Web layber route table
resource "aws_route_table" "web-rt" {
  vpc_id = aws_vpc.vpc.id


  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "WebRT"
  }
}

# Create Web Subnet association with Web route table
resource "aws_route_table_association" "web_rt_association" {
  count          = length(var.web_subnets)
  subnet_id      = aws_subnet.web-subnet[count.index].id
  route_table_id = aws_route_table.web-rt.id
}