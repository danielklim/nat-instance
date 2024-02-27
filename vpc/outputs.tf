output "vpc_output" {
    description     = "VPC Outputs"
    value           = { "main_cidr_block" : aws_vpc.main_vpc.cidr_block, "id" : aws_vpc.main_vpc.id }
}

output "public_subnets_output" {
    description     = "Public Subnets"
    value           = [ for subnet in aws_subnet.public_subnets : { "name" :  subnet.tags.Name, "subnet_id" : subnet.id, "cidr_block" : subnet.cidr_block, "availability_zone" : subnet.availability_zone } ]
}

output "private_subnets_output" {
    description     = "Private Subnets"
    value           = [ for subnet in aws_subnet.private_subnets : { "name" :  subnet.tags.Name, "subnet_id" : subnet.id,  "cidr_block" : subnet.cidr_block, "availability_zone" : subnet.availability_zone } ]
}

output "main_route_table_output" {
    description     = "Main Route Table id."
    value           = { "main_route_table_id" : aws_route_table.main_route_table.id }
}

output "private_route_tables_output" {
    description     = "Private Route Table ids."
    value           = [ for table in aws_route_table.private_subnet_route_tables : { "name" : table.tags.Name, "route_table_id" : table.id } ]
}