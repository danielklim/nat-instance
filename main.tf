module "example_vpc" {
    source                              = "../../vpc"
    vpc_name                            = "Protein Meal Prep Staging VPC"
    main_cidr_block                     = var.main_cidr_block
    public_cidr_blocks                  = var.public_cidr_blocks
    private_cidr_blocks                 = var.private_cidr_blocks
    environment                         = local.environment
    region                              = var.region
    availability_zones                  = var.availability_zones
}

module "example_nat_instance_key_pair" {
    source                              = "./key_pair"
    key_name                            = "nat_instance_${var.environment}"
}

module "example_nat_instance" {
    source                              = "./nat_instance"
    nat_instance_ami_id                 = "ami-09abb6457c770f890"
    main_vpc_id                         = module.example_vpc.vpc_output.id
    main_cidr_block                     = var.main_cidr_block
    public_cidr_blocks                  = var.public_cidr_blocks
    private_cidr_blocks                 = var.private_cidr_blocks
    public_subnet_ids                   = [ for output in module.example_vpc.public_subnets_output : output.subnet_id ]
    private_subnet_ids                  = [ for output in module.example_vpc.private_subnets_output : output.subnet_id ]
    private_subnet_route_table_ids      = [ for output in module.example_vpc.private_route_tables_output : output.route_table_id ]
    private_ips_for_ssh                 = var.private_ips_for_ssh
    ec2_key_name                        = module.staging_nat_instance_key_pair.output.key_name
    environment                         = var.environment
    region                              = var.region
}

module "example_rds_ssh_key_secret" {
    source                              = "../../secrets"
    name                                = "protein_meal_prep_rds_ssh_private_key"
    description                         = "Private Key used for SSH Tunnel connection to RDS Instance for example Protein Meal Prep."
    environment                         = local.environment
    secret_string                       = module.staging_rds_ssh_tunnel_key_pair.sensitive_output.private_key
}
