locals {
    environment                         = "testing"
    vpc_name                            = "NAT Instance VPC"
    ssh_key_secret_name                 = "example_ssh_key_pem"
    ssh_key_secret_description          = "pem used for NAT Instance connection"
    nat_instance_key_name               = "nat_instance_key"
    tags                                = {
        Environment                         = local.environment
        Terraform                           = true
    }
}


module "example_vpc" {
    source                              = "terraform-aws-modules/vpc/aws"
    name                                = local.vpc_name
    cidr                                = var.main_cidr_block
    public_subnets                      = var.public_cidr_blocks
    private_subnets                     = var.private_cidr_blocks
    azs                                 = var.availability_zones
    tags                                = local.tags
}

module "example_nat_instance_key_pair" {
    source                              = "./key_pair"
    key_name                            = local.nat_instance_key_name
    tags                                = local.tags
}

module "example_ssh_key_secret" {
    source                              = "./secrets"
    name                                = local.ssh_key_secret_name
    description                         = local.ssh_key_secret_description
    secret_string                       = module.example_nat_instance_key_pair.sensitive_output.pem
    tags                                = local.tags
}

module "example_nat_instances" {
    source                              = "./nat_instance"
    nat_instance_ami_id                 = "ami-09abb6457c770f890"
    main_vpc_id                         = module.example_vpc.vpc_id
    main_cidr_block                     = var.main_cidr_block
    public_cidr_blocks                  = var.public_cidr_blocks
    add_nat_testing_instances           = true
    private_cidr_blocks                 = var.private_cidr_blocks
    public_subnet_ids                   = module.example_vpc.public_subnets
    private_subnet_ids                  = module.example_vpc.private_subnets
    private_subnet_route_table_ids      = module.example_vpc.private_route_table_ids
    private_ips_for_ssh                 = var.private_ips_for_ssh
    ec2_key_name                        = module.example_nat_instance_key_pair.output.key_name
    region                              = var.region
    tags                                = local.tags
}
