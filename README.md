# AWS and Terraform Demystified
## Creating a NAT Instance using Terraform

Repository containining source code and scripts for the Medium Article I wrote about creating a NAT Instance using terraform.


## Key secretsmanager cli commands to accessing secrets stored using terraform

### Listing all secrets

>`aws secretsmanager list-secrets`

### Get String Value from Secret

>`aws secretsmanager get-secret-value --secret-id example_ssh_key_pem_testing --query SecretString --output text`

### Using cli script to convert AWS Secret String value to .pem

>`aws secretsmanager get-secret-value --secret-id example_ssh_key_pem_testing --query SecretString --output text | base64 --decode > test.pem`