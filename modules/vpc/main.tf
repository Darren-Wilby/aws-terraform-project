# VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "main"
  }
}


# public subnets
resource "aws_subnet" "public" {
  count             = length(var.availability_zones)
  cidr_block        = var.public_cidr[count.index]
  vpc_id            = aws_vpc.main.id
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "public-subnet-${count.index + 1}"
  }
}


# private subnets
resource "aws_subnet" "private" {
  count             = length(var.availability_zones)
  cidr_block        = var.private_cidr[count.index]
  vpc_id            = aws_vpc.main.id
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "private-subnet-${count.index + 1}"
  }
}


# public
# internet gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.vpc_name}-igw"
  }
}

# public route table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.vpc_name}-public"
  }
}

# public route
resource "aws_route" "public_internet" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}

# public route table association
resource "aws_route_table_association" "public_subnet_assoc" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}


# private

# private route tables
resource "aws_route_table" "private" {
  count  = length(var.private_cidr)
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.vpc_name}-private-${count.index + 1}"
  }
}

# private route table associations
resource "aws_route_table_association" "private_subnet_assoc" {
  count          = length(aws_subnet.private)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[count.index].id
}


# __Not needed for now__

# # elastic IP addresses
# resource "aws_eip" "nat_eip" {
#   count = length(aws_subnet.private)
#   domain = "vpc"
# }


# # NAT gateways
# resource "aws_nat_gateway" "nat_gateway" {
#   count         = length(var.private_cidr)
#   allocation_id = aws_eip.nat_eip[count.index].id
#   subnet_id     = aws_subnet.private[count.index].id

#   tags = {
#     Name = "nat-gateway-${count.index + 1}"
#   }
# }


# # private routes
# resource "aws_route" "private" {
#   count                  = length(aws_subnet.private)
#   route_table_id         = aws_route_table.private[count.index].id
#   destination_cidr_block = "0.0.0.0/0"
#   nat_gateway_id         = aws_nat_gateway.nat_gateway[count.index].id
# }
