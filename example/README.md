# NAT Instance Example

Configuration in this directory creates:

- VPC using aws-terraform-modules vpc module
- ssh key using RSA Encryption
- AWS Secret for ssh key
- NAT Instance and NAT Testing Instances in public and private subnets of VPC


## Usage

Need to execute the below commands

>`terraform init`
>`terraform plan`
>`terraform apply`

Note that this example may create resources which will incur monetary charges on your AWS bill. Run terraform destroy when you no longer need these resources.

## Requirements

| Name          | Version       |
| -----         | ----          |
https://github.com/terraform-aws-modules/terraform-aws-ecs/blob/master/examples/complete/README.md#requirement_terraform