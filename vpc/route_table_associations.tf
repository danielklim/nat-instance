resource "aws_route_table_association" "public_subnet_association" {
    count               = length(var.public_cidr_blocks)
    subnet_id           = element(aws_subnet.public_subnets[*].id, count.index)
    route_table_id      = aws_route_table.main_route_table.id
}

resource "aws_route_table_association" "private_subnet_rt_association" {
    count               = length(var.private_cidr_blocks)
    subnet_id           = element(aws_subnet.private_subnets[*].id, count.index)
    route_table_id      = element(aws_route_table.private_subnet_route_tables[*].id, count.index)
}
