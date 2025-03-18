data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_internet_gateway" "igw" {
  filter {
    name   = "tag:Name"
    values = [var.igw_name]
  }
}

data "aws_subnet" "subnet" {
  filter {
    name   = "tag:Name"
    values = [var.subnet_name]
  }
}

data "aws_security_group" "sg_default" {
  filter {
    name   = "tag:Name"
    values = [var.security_group_name]
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = data.aws_vpc.vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet_name_2
  }
}

resource "aws_route_table" "rt_2" {
  vpc_id = data.aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = data.aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.rt_name_2
  }
}

resource "aws_route_table_association" "rt_association_2" {
  route_table_id = aws_route_table.rt_2.id
  subnet_id      = aws_subnet.public_subnet_2.id
}