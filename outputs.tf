output "staging_vpc_output" {
    description             = "Output from VPC Module for Test Environment."
    value                   = module.staging_vpc.vpc_output
}

output "staging_public_subnets_output" {
    description             = "Output from VPC Module for public subnets."
    value                   = module.staging_vpc.public_subnets_output
}

output "staging_private_subnets_output" {
    description             = "Output from VPC Module for private subnets."
    value                   = module.staging_vpc.private_subnets_output
}

output "staging_main_route_table_output" {
    description             = "Output from VPC Module for main route table."
    value                   = module.staging_vpc.main_route_table_output
}

output "staging_private_route_tables_output" {
    description             = "Output from VPC Module for private route table."
    value                   = module.staging_vpc.private_route_tables_output
}

output "staging_nat_instance_output" {
    description             = "Output from NAT Instance Module."
    value                   = module.staging_nat_instance.nat_instances_output
}

output "staging_nat_testing_instances_output" {
    description             = "Output from the NAT Instance Module for the NAT Instances in the private subnet for testing."
    value                   = module.staging_nat_instance.nat_testing_instances_output
}

output "staging_ecr_backend_repository_output" {
    description             = "Output from the ECR Module for the backend_service repository."
    value                   = module.staging_ecr_repository.ecr_repository_output
}

output "staging_ecs_alb_output" {
    description             = "Output from the ECS module."
    value                   = module.staging_ecs_alb.alb_output
}

output "staging_rds_output" {
    description             = "Output from the RDS Module."
    value                   = { "database_output" : module.staging_rds_instance.database_output, "ssh_tunnel_output" : module.staging_rds_instance.ssh_tunnel_output }
}