resource "aws_security_group" "nat_instance_sg" {
    name                = "nat_instance_sg"
    description         = "Security Group for NAT Instances."
    vpc_id              = var.main_vpc_id
    tags                = "${merge(var.tags,
                                    map("Name", "NAT Instances Security Group"))}"
}

resource "aws_security_group" "nat_testing_instance_sg" {
    name                = "nat_testing_instance_sg"
    description         = "Security Group for NAT Testing Instances."
    vpc_id              = var.main_vpc_id
    tags                = "${merge(var.tags,
                                    map("Name", "NAT Testing Instances Security Group"))}"
}
