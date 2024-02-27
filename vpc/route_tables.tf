resource "aws_route_table" "main_route_table" {
    vpc_id              = aws_vpc.main_vpc.id

    route {
        cidr_block      = "0.0.0.0/0"
        gateway_id      = aws_internet_gateway.internet_gateway.id
    }

    tags = {
        Name            = "${var.vpc_name} Route Table"
        terraform       = true
        environment     = var.environment
    }
}

resource "aws_route_table" "private_subnet_route_tables" {
    count               = length(var.private_cidr_blocks)
    vpc_id              = aws_vpc.main_vpc.id

    tags = {
        Name            = "${var.vpc_name} Private Subnet Route Table ${count.index + 1}"
        terraform       = true
        environment     = "test"
    }
}