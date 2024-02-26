output "nat_instances_output" {
    description     = "Object providing public ip address for NAT Instances."
    value           = [ for instance in aws_instance.nat_aws_instances : { "name" : instance.tags.Name, "public_ip_address" : instance.public_ip } ]
}

output "nat_testing_instances_output" {
    description     = "Object providing private ip address for NAT Testing instances in the private subnet."
    value           = [ for instance in aws_instance.nat_testing_aws_instances :  { "name" : instance. tags.Name, "private_ip_address" : instance.private_ip } ]
}