# AWS and Terraform Demystified - Creating a NAT Instance using Terraform

Repository containining the source code, root module for the Medium Article I wrote about creating a NAT Instance using terraform.

https://medium.com/@gazick/how-to-assign-a-static-ip-address-to-aws-lambda-using-nat-instance-2eab02b76d12

## Usage

### Creates NAT Instances within each public subnet of a VPC.

```hcl
locals {
    vpc_name                            = "NAT Instance VPC"
    ssh_key_secret_name                 = "example_ssh_key_pem_3"
    ssh_key_secret_description          = "pem used for NAT Instance connection"
    nat_instance_key_name               = "nat_instance_key"
    main_cidr_block                     = "10.0.0.0/16"
    public_cidr_blocks                  = ["10.0.1.0/24", "10.0.2.0/24"]
    private_cidr_blocks                 = ["10.0.5.0/24", "10.0.6.0/24"]
    region                              = "eu-west-2"
    availability_zones                  = ["eu-west-2a", "eu-west-2b"]
    private_ips_for_ssh                 = ["213.89.115.84/32"]
    nat_instance_ami_id                 = "ami-09abb6457c770f890"
    tags                                = {
        Environment                         = "testing"
        Terraform                           = true
    }
}

module "vpc" {
    source                              = "terraform-aws-modules/vpc/aws"
    name                                = local.vpc_name
    cidr                                = local.main_cidr_block
    public_subnets                      = local.public_cidr_blocks
    private_subnets                     = local.private_cidr_blocks
    azs                                 = local.availability_zones
    tags                                = local.tags
}

module "nat_instance_key_pair" {
    source                              = "../module/key_pair"
    key_name                            = local.nat_instance_key_name
    tags                                = local.tags
}

module "ssh_key_secret" {
    source                              = "../module/secrets"
    name                                = local.ssh_key_secret_name
    description                         = local.ssh_key_secret_description
    secret_string                       = module.nat_instance_key_pair.sensitive_output.pem
    tags                                = local.tags
}

module "nat_instances" {
    source                              = "../module/nat_instance"
    nat_instance_ami_id                 = local.nat_instance_ami_id
    main_vpc_id                         = module.vpc.vpc_id
    main_cidr_block                     = local.main_cidr_block
    public_cidr_blocks                  = local.public_cidr_blocks
    create_nat_testing_instances        = true
    private_cidr_blocks                 = local.private_cidr_blocks
    public_subnet_ids                   = module.vpc.public_subnets
    private_subnet_ids                  = module.vpc.private_subnets
    private_subnet_route_table_ids      = module.vpc.private_route_table_ids
    private_ips_for_ssh                 = local.private_ips_for_ssh
    ec2_key_name                        = module.nat_instance_key_pair.output.key_name
    region                              = local.region
    tags                                = local.tags
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.66.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.66.1 |

## Examples

- [Main Example](https://github.com/Mark-Barbaric/aws-and-terraform-demystified-nat-instance/examples)

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="vpc"></a> [vpc](https://github.com/terraform-aws-modules/terraform-aws-vpc) | terraform-aws-modules/vpc/aws | n/a |
| <a name="key_pair"></a> [key_pair](#module\key_pair) | ./module/key_pair | n/a |
| <a name="nat_instance"></a> [nat_instance](#module\nat_instance) | ./module/nat_instance | n/a |
| <a name="secrets"></a> [secrets](#module\secrets) | ./module/secrets | n/a |

## Inputs


## Outputs


| Name | Description |
|------|-------------|
| <a name="nat_instances_output"></a> [nat_instances_output](#modules/nat_instance) | List of objects containing name and ip_address of nat instances |
| <a name="nat_testing_instances_output"></a> [nat_testing_instances_output](#/module/nat_instance) | List of objects containing name and ip_address of nat testing instances |

## Key secretsmanager cli commands to accessing secrets stored using terraform

### Listing all secrets

>`aws secretsmanager list-secrets`

### Get String Value from Secret

>`aws secretsmanager get-secret-value --secret-id <SECRET_ARN> --query SecretString --output text`

### Using cli script to convert AWS Secret String value to .pem

>`aws secretsmanager get-secret-value --secret-id <SECRET_ARN> --query SecretString --output text | base64 --decode > test.pem`
