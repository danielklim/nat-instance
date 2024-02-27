variable "region" {
  description         = "AWS Region for the service"
  type                = string
}

variable "vpc_name" {
  description         = "Name of the VPC"
  type                = string
}

variable "main_cidr_block" {
  description         = "CIDR Block for main vpc"
  type                = string
}

variable "public_cidr_blocks" {
  type               = list(string)
  description        = "Public Subnet CIDR Blocks."
}
 
variable "private_cidr_blocks" {
  type               = list(string)
  description        = "Private Subnet CIDR Blocks."
}

variable "availability_zones" {
  type               = list(string)
  description        = "Availability zones for the subnets."
}

variable "environment" {
  type               = string
  description        = "Environment the VPC belongs to."   
}