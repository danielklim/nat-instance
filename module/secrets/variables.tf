variable "name" {
  description = "Name for the secrets."
  type        = string
}

variable "description" {
  description = "Description for the secrets."
  type        = string
}

variable "secret_string" {
  description = "Secrets passed as a string value."
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Tags for the secrets module."
  type        = map(string)
  default     = {}
}