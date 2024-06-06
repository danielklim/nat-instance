#####################################################################
# VPC Variables
#####################################################################

variable "main_cidr_block" {
  description         = "CIDR Block for main vpc"
  type                = string
}

variable "availability_zones" {
  description         = "Availability Zones used within the region."
  type                = list(string)
}

variable "public_cidr_blocks" {
  type               = list(string)
  description        = "Public Subnet CIDR Blocks."
}
 
variable "private_cidr_blocks" {
  type               = list(string)
  description        = "Private Subnet CIDR Blocks."
}


#####################################################################
# NAT Instance Variables
#####################################################################


variable "private_ips_for_ssh" {
  type               = list(string)
  description        = "List of IP Addresses used for SSH Ingress."
}

#####################################################################
# NAT Instance Variables
#####################################################################



#####################################################################
# General Resource Variables
#####################################################################

variable "environment" {
  description       = "Environment the NAT Instance is being provisioned in."
  type              = string
}

variable "tags" {
  description       = "Tags to be passed to the resources."
  type              = map(string)
}

variable "region" {
    description     = "Region for the resources"
    type            = string
}