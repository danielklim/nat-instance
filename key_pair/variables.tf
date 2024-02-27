variable "key_name" {
    description                 = "Name of the private key created"
    type                        = string
}

variable "rsa_algorithm" {
    description                 = "Algorithm used to key generation."
    type                        = string
    default                     = "RSA"
}

variable "rsa_bits" {
    description                 = "Level of encryption."
    type                        = number
    default                     = 4096
}