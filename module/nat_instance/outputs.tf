output "nat_instances_output" {
  description = "List of dicts providing ip addresses for NAT Instances."
  value       = [for instance in aws_instance.nat_aws_instances : { "name" : instance.tags.Name, "ip_address" : instance.public_ip }]
}
