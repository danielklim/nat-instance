variable "region" {
  description         = "AWS Region for the service"
  type                = string
  default             = "eu-central-1"
}

variable "nat_instance_ami_id" {
  description         = "AMI ID for NAT Instance"
  type                = string
}

variable "main_vpc_id" {
  description         = "ID For the VPC ID."
  type                = string
}

variable "main_cidr_block" {
  description         = "CIDR Block for main vpc"
  type                = string
}

variable "public_cidr_blocks" {
  type               = list(string)
  description        = "Public Subnet CIDR values"
}
 
variable "private_cidr_blocks" {
  type               = list(string)
  description        = "Private Subnet CIDR Blocks"
}

variable "public_subnet_ids" {
  type                = list(string)
  description         = "IDs for the Public Subnets."
}

variable "private_subnet_ids" {
  type                = list(string)
  description         = "IDs for the Private Subnets."
}

variable "private_subnet_route_table_ids" {
  type                = list(string)
  description         = "IDs for Route Tables within Private Subnets."
}

variable "private_ips_for_ssh" {
  type                = list(string)
  description         = "IP Addresss which will allow SSH Connections from outside of VPC."
}

variable "ec2_key_name" {
  type                = string
  description         = "Keyname used for ssh access to EC2 instances."
}

variable "environment" {
  type                = string
  description         = "Environment the NAT Instance is being deployed to."
}