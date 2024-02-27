output "output" {
    description             = "Key name used for access to ECS Instances."
    value                   = { "key_name": aws_key_pair.main.key_name }
}

output "sensitive_output" {
    description             = "Private Key output from keygen"
    value                   = {"private_key" : tls_private_key.primary_key.private_key_pem }
    sensitive               = true
}
