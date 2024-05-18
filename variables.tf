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

variable "private_ips_for_ssh" {
  type               = list(string)
  description        = "List of IP Addresses used for SSH Ingress."
}

variable "region" {
    description     = "Region for the resources"
    type            = string
}