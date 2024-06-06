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
