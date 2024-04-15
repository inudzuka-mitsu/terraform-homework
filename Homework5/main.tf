resource "aws_vpc" "kaizen_vpc" {
  cidr_block           = var.vpc_data[0].cidr
  enable_dns_support   = var.vpc_data[0].is_dns_support_enabled
  enable_dns_hostnames = var.vpc_data[0].is_dns_hostnames_enabled
  tags = {
    Name = var.vpc_data[0].name
  }
}

resource "aws_internet_gateway" "homework5_igw" {
  vpc_id = aws_vpc.kaizen_vpc.id

  tags = {
    Name = var.ig_name
  }
}

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.kaizen_vpc.id

  route {
   cidr_block = "0.0.0.0/0"
   gateway_id = aws_internet_gateway.homework5_igw.id
  }

  tags = {
    Name = var.route_table_names[0]
  }
}

resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.kaizen_vpc.id

  tags = {
    Name = var.route_table_names[1]
  }
}

resource "aws_route_table_association" "public-association" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "public-association2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "private-association" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private-rt.id
}

resource "aws_route_table_association" "private-association2" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private-rt.id
}