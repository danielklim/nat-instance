# AWS and Terraform Demystified - Creating a NAT Instance using Terraform

Repository containining the source code, root module and example for the Medium Article I wrote about creating a NAT Instance using terraform.


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

- [Main Example](https://github.com/Mark-Barbaric/aws-and-terraform-demystified-nat-instance)

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="vpc"></a> [vpc](https://github.com/terraform-aws-modules/terraform-aws-vpc) | terraform-aws-modules/vpc/aws | n/a |
| <a name="key_pair"></a> [key_pair](#module\key_pair) | ./modules/key_pair | n/a |
| <a name="nat_instance"></a> [nat_instance](#module\nat_instance) | ./modules/nat_instance | n/a |
| <a name="secrets"></a> [nat_instance](#module\secrets) | ./modules/secrets | n/a |

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

>`aws secretsmanager get-secret-value --secret-id example_ssh_key_pem_testing --query SecretString --output text`

### Using cli script to convert AWS Secret String value to .pem

>`aws secretsmanager get-secret-value --secret-id example_ssh_key_pem_testing --query SecretString --output text | base64 --decode > test.pem`