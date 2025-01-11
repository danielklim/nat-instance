terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  access_key = local.aws_settings.access_key
  secret_key = local.aws_settings.secret_key
  region     = local.aws_settings.region
}
