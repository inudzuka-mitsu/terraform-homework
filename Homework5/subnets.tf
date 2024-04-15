resource "aws_subnet" "public1" {
  vpc_id                  = aws_vpc.kaizen_vpc.id
  cidr_block              = var.subnets_data[0].cidr
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true
  tags = {
    Name = var.subnets_data[0].name
  }
}

resource "aws_subnet" "public2" {
  vpc_id                  = aws_vpc.kaizen_vpc.id
  cidr_block              = var.subnets_data[1].cidr
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = true
  tags = {
    Name = var.subnets_data[1].name
  }
}

resource "aws_subnet" "private1" {
  vpc_id            = aws_vpc.kaizen_vpc.id
  cidr_block        = var.subnets_data[2].cidr
  availability_zone = "${var.region}c"
  tags = {
    Name = var.subnets_data[2].name
  }
}

resource "aws_subnet" "private2" {
  vpc_id            = aws_vpc.kaizen_vpc.id
  cidr_block        = var.subnets_data[3].cidr
  availability_zone = "${var.region}d"
  tags = {
    Name = var.subnets_data[3].name
  }
}