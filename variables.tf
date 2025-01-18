variable "access_key" {
  type      = string
  sensitive = false
  default   = null
}

variable "secret_key" {
  type      = string
  sensitive = true
  default   = null
}

variable "use_localstack" {
  type    = bool
  default = true
}


#####################################################################
# VPC Variables
#####################################################################

variable "vpc_name" {
  description = "Name of the VPC."
  type        = string
}

variable "main_cidr_block" {
  description = "CIDR Block for the Main VPC."
  type        = string
}

variable "public_cidr_blocks" {
  description = "Public Subnet CIDR Blocks."
  type        = list(string)
}

variable "private_cidr_blocks" {
  type        = list(string)
  description = "Private Subnet CIDR Blocks."
}

variable "availability_zones" {
  description = "Availability Zones used within the region."
  type        = list(string)
}

#####################################################################
# NAT Instance Key Pair Variables
#####################################################################

variable "nat_instance_key_name" {
  description = "Name of the key pair used for the EC2 Instances."
  type        = string
}

#####################################################################
# SSH Key Secrets
#####################################################################

variable "ssh_key_secret_name" {
  description = "Name of the ssh key secret."
  type        = string
}

variable "ssh_key_secret_description" {
  description = "Description of the ssh key secret."
  type        = string
}

#####################################################################
# NAT Instance Variables
#####################################################################

variable "private_ips_for_ssh" {
  description = "List of IP Addresses used for SSH Ingress."
  type        = list(string)
}

#####################################################################
# General Variables
#####################################################################

variable "environment" {
  description = "Environment the NAT Instance is being provisioned in."
  type        = string
  default     = "DEV"
}

variable "tags" {
  description = "Tags to be passed to the resources."
  type        = map(string)
  default = {
  }
}

variable "region" {
  description = "Region for the resources"
  type        = string
  default     = null
}