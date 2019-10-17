#-----networking/main.tf
# Create a data resource
data "aws_availability_zones" "available" {
}

# Overall Networking Schema
resource "aws_vpc" "ayx_vpc" {
  cidr_block           = var.VPC_CIDR
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "ayx_vpc"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "ayx_igw" {
  vpc_id = aws_vpc.ayx_vpc.id

  tags = {
    Name = "ayx_igw"
  }
}

# Public Route Table
resource "aws_route_table" "ayx_public_rt" {
  vpc_id = aws_vpc.ayx_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ayx_igw.id
  }

  tags = {
    Name = "ayx_public"
  }
}

# Private Route Table
resource "aws_default_route_table" "ayx_private_rt" {
  default_route_table_id = aws_vpc.ayx_vpc.default_route_table_id

  tags = {
    Name = "ayx_private"
  }
}

resource "aws_subnet" "ayx_public_subnet" {
  #count                   = 2
  vpc_id     = aws_vpc.ayx_vpc.id
  cidr_block = var.PRIVATE_CIDRS

  #cidr_block              = "${var.PRIVATE_CIDRS[count.index]}"
  map_public_ip_on_launch = true
  availability_zone       = var.AWS_AVAILABILITY_ZONE

  # availability_zone      = "${data.aws_availability_zones.available.names[count.index]}"

  tags = {
    Name = "ayx_public_${count.index + 1}"
  }
}

resource "aws_route_table_association" "ayx_public_assoc" {
  #count          = "${aws_subnet.ayx_public_subnet.count}"
  subnet_id = aws_subnet.ayx_public_subnet.id

  #subnet_id      = "${aws_subnet.ayx_public_subnet.*.id[count.index]}"
  route_table_id = aws_route_table.ayx_public_rt.id
}

# Securing the environment
resource "aws_security_group" "ayx_public_sg" {
  name        = "ayx_public_sg"
  description = "Used for access to the public instances"
  vpc_id      = aws_vpc.ayx_vpc.id

  # Incoming Traffic
  # RDP
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = var.ALLOWEDIPS
  }

  # Custom TCP
  ingress {
    from_port   = 81
    to_port     = 81
    protocol    = "tcp"
    cidr_blocks = var.ALLOWEDIPS
  }

  # HTTP
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.ALLOWEDIPS
  }

  # HTTPS
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.ALLOWEDIPS
  }

  ingress {
    from_port   = 5985
    to_port     = 5985
    protocol    = "tcp"
    cidr_blocks = var.ALLOWEDIPS
  }

  # Outgoing Traffic
  # HTTP
  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.ALLACCESSIPS
  }

  # HTTPS
  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.ALLACCESSIPS
  }

  egress {
    from_port   = 5985
    to_port     = 5985
    protocol    = "tcp"
    cidr_blocks = var.ALLACCESSIPS
  }
}

