/*
Collection of all objects that make of VPC and necessary routing
aws_vpc.main - main VPC for all objects
aws_route_table.private - private route table to be assigned to private subnet
aws_route_table.public - public route table to be assigned to public subnet
aws_route_table_association.public/.private - association of public/private tables to public/private subnets
aws_subnet.public/.private - subnets for public private networks
aws_nat_gateway.gw - NAT Gateway service to be launched in public subnet as a route for private subnet's route table
aws_internet_gateway.gw - Internet Gateway service used as the internet gateway for the VPC
*/

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = "${merge(var.common_tags,map("Name","Main VPC"))}"
}

resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.main.id}"
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.gw.id}"
  }
  tags = "${merge(var.common_tags,map("Name","Private Route Table"))}"
}

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.main.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
  tags = "${merge(var.common_tags,map("Name","Public Route Table"))}"
}

resource "aws_route_table_association" "public" {
  subnet_id = "${aws_subnet.public.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "private" {
  subnet_id = "${aws_subnet.private.id}"
  route_table_id = "${aws_route_table.private.id}"
}

resource "aws_subnet" "public" {
  vpc_id   = "${aws_vpc.main.id}"
  cidr_block = "10.0.0.0/24"
  tags = "${merge(var.common_tags,map("Name","Public Subnet"))}"
}

resource "aws_subnet" "private" {
  vpc_id   = "${aws_vpc.main.id}"
  cidr_block = "10.0.1.0/24"
  tags = "${merge(var.common_tags,map("Name","Private Subnet"))}"
}

resource "aws_nat_gateway" "gw" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id   = "${aws_subnet.public.id}"
  tags = "${merge(var.common_tags,map("Name","NAT Gateway"))}"
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main.id}"
  tags = "${merge(var.common_tags,map("Name","Internet Gateway"))}"
}
