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
| <a name="output_autoscaling_capacity_providers"></a> [autoscaling\_capacity\_providers](#output\_autoscaling\_capacity\_providers) | Map of autoscaling capacity providers created and their attributes |
| <a name="output_cloudwatch_log_group_arn"></a> [cloudwatch\_log\_group\_arn](#output\_cloudwatch\_log\_group\_arn) | ARN of CloudWatch log group created |
| <a name="output_cloudwatch_log_group_name"></a> [cloudwatch\_log\_group\_name](#output\_cloudwatch\_log\_group\_name) | Name of CloudWatch log group created |
| <a name="output_cluster_arn"></a> [cluster\_arn](#output\_cluster\_arn) | ARN that identifies the cluster |
| <a name="output_cluster_capacity_providers"></a> [cluster\_capacity\_providers](#output\_cluster\_capacity\_providers) | Map of cluster capacity providers attributes |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | ID that identifies the cluster |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | Name that identifies the cluster |
| <a name="output_services"></a> [services](#output\_services) | Map of services created and their attributes |
| <a name="output_task_exec_iam_role_arn"></a> [task\_exec\_iam\_role\_arn](#output\_task\_exec\_iam\_role\_arn) | Task execution IAM role ARN |
| <a name="output_task_exec_iam_role_name"></a> [task\_exec\_iam\_role\_name](#output\_task\_exec\_iam\_role\_name) | Task execution IAM role name |
| <a name="output_task_exec_iam_role_unique_id"></a> [task\_exec\_iam\_role\_unique\_id](#output\_task\_exec\_iam\_role\_unique\_id) | Stable and unique string identifying the task execution IAM role |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Key secretsmanager cli commands to accessing secrets stored using terraform

### Listing all secrets

>`aws secretsmanager list-secrets`

### Get String Value from Secret

>`aws secretsmanager get-secret-value --secret-id example_ssh_key_pem_testing --query SecretString --output text`

### Using cli script to convert AWS Secret String value to .pem

>`aws secretsmanager get-secret-value --secret-id example_ssh_key_pem_testing --query SecretString --output text | base64 --decode > test.pem`