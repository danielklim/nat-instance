resource "aws_vpc" "main_vpc" {
  cidr_block            = var.main_cidr_block
  enable_dns_support    = "true"
  enable_dns_hostnames  = "true"
  tags = {
      Name              = "${var.vpc_name}"
      terraform         = true
      environment       = "dev"
  }
}

resource "aws_internet_gateway" "internet_gateway" {
    vpc_id              = aws_vpc.main_vpc.id

    tags = {
        Name            = "${var.vpc_name} Gateway"
        terraform       = true
        environment     = "test"
    }
}

resource "aws_subnet" "public_subnets" {
  vpc_id              = aws_vpc.main_vpc.id
  count               = length(var.public_cidr_blocks)
  cidr_block          = element(var.public_cidr_blocks, count.index)
  availability_zone   = element(var.availability_zones, count.index % length(var.availability_zones))
  
  tags = {
      Name            = "${var.vpc_name} Public Subnet ${count.index + 1}"
      terraform       = true
      environment     = var.environment
  }
}

resource "aws_subnet" "private_subnets" {
  vpc_id            = aws_vpc.main_vpc.id
  count             = length(var.private_cidr_blocks)
  cidr_block        = element(var.private_cidr_blocks, count.index)
  availability_zone = element(var.availability_zones, count.index % length(var.availability_zones))
  tags = {
      Name          = "${var.vpc_name} Private Subnet ${count.index + 1}"
      terraform     = true
      environment   = var.environment
  }
}