output "vpc_output" {
    description             = "Staging VPC Arn."
    value                   = module.vpc.vpc_arn
}

output "public_subnets_output" {
    description             = "ARNs for the Public Subnets for testing envirnoment."
    value                   = module.vpc.public_subnets
}

output "private_subnets_output" {
    description             = "ARNs for the Private Subnets for the testing environment."
    value                   = module.vpc.private_subnets
}

output "main_route_table_output" {
    description             = "ARN for the Main Route Table."
    value                   = module.vpc.vpc_main_route_table_id
}

output "private_route_tables_output" {
    description             = "Main Route Table ARN for testing environment."
    value                   = module.vpc.vpc_main_route_table_id
}

output "nat_instance_output" {
    description             = "Output from NAT Instance Module."
    value                   = module.nat_instances.nat_instances_output
}

output "nat_instances_output" {
    description             = "Output from the NAT Instance Module for the NAT Instances in the private subnet for testing."
    value                   = module.nat_instances.nat_instances_output
}