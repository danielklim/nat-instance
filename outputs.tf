output "staging_vpc_output" {
    description             = "Output from VPC Module for Test Environment."
    value                   = module.example_vpc.vpc_output
}

output "staging_public_subnets_output" {
    description             = "Output from VPC Module for public subnets."
    value                   = module.example_vpc.public_subnets_output
}

output "staging_private_subnets_output" {
    description             = "Output from VPC Module for private subnets."
    value                   = module.example_vpc.private_subnets_output
}

output "staging_main_route_table_output" {
    description             = "Output from VPC Module for main route table."
    value                   = module.example_vpc.main_route_table_output
}

output "staging_private_route_tables_output" {
    description             = "Output from VPC Module for private route table."
    value                   = module.example_vpc.private_route_tables_output
}

output "staging_nat_instance_output" {
    description             = "Output from NAT Instance Module."
    value                   = module.example_nat_instance.nat_instances_output
}

output "staging_nat_testing_instances_output" {
    description             = "Output from the NAT Instance Module for the NAT Instances in the private subnet for testing."
    value                   = module.example_nat_instance.nat_testing_instances_output
}