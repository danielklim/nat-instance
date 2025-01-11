locals {
  is_localstack = var.use_localstack
  env           = local.is_localstack ? "LOCALSTACK" : "AWS"

  aws_settings = (
    var.use_localstack ?
    {
      access_key                  = "fake"
      secret_key                  = "fake"
      region                      = "us-west-2"
      skip_credentials_validation = true
      skip_metadata_api_check     = true
      skip_requesting_account_id  = true
      override_endpoint           = "http://localhost:4566"
      profile                     = null
      } : {
      access_key                  = var.access_key
      secret_key                  = var.secret_key
      region                      = var.region
      skip_credentials_validation = null
      skip_metadata_api_check     = null
      skip_requesting_account_id  = null

      override_endpoint = null
    }
  )
}
