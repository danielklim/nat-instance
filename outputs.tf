output "testing_vpc_output" {
    description             = "Staging VPC Arn."
    value                   = module.example_vpc.vpc_arn
}

output "testing_public_subnets_output" {
    description             = "ARNs for the Public Subnets for testing envirnoment."
    value                   = module.example_vpc.public_subnets
}

output "testing_private_subnets_output" {
    description             = "ARNs for the Private Subnets for the testing environment."
    value                   = module.example_vpc.private_subnets
}

output "testing_main_route_table_output" {
    description             = "ARN for the Main Route Table."
    value                   = module.example_vpc.vpc_main_route_table_id
}

output "testing_private_route_tables_output" {
    description             = "Main Route Table ARN for testing environment."
    value                   = module.example_vpc.vpc_main_route_table_id
}

output "testing_nat_instance_output" {
    description             = "Output from NAT Instance Module."
    value                   = module.example_nat_instances.nat_instances_output
}

output "testing_nat_testing_instances_output" {
    description             = "Output from the NAT Instance Module for the NAT Instances in the private subnet for testing."
    value                   = module.example_nat_instances.nat_testing_instances_output
}