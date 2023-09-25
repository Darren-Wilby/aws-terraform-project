# VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }
}


# Public subnets
resource "aws_subnet" "public" {
  count             = length(var.availability_zones)
  cidr_block        = var.public_cidr[count.index]
  vpc_id            = aws_vpc.main.id
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "public-subnet-${count.index + 1}"
  }
}


# Private subnets
resource "aws_subnet" "private" {
  count             = length(var.availability_zones)
  cidr_block        = var.private_cidr[count.index]
  vpc_id            = aws_vpc.main.id
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "private-subnet-${count.index + 1}"
  }
}


# Internet gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.vpc_name}-igw"
  }
}


# Public route table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.vpc_name}-public-route-table"
  }
}


# Public route
resource "aws_route" "public_internet" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}


# Public route table association
resource "aws_route_table_association" "public_subnet_assoc" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}


# Private route tables
resource "aws_route_table" "private" {
  count  = length(var.private_cidr)
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.vpc_name}-private-route-table-${count.index + 1}"
  }
}


# Private route table associations
resource "aws_route_table_association" "private_subnet_assoc" {
  count          = length(aws_subnet.private)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[count.index].id
}