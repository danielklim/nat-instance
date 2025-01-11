resource "aws_security_group_rule" "nat_instance_inbound_sg_rule" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = [var.main_cidr_block]
  security_group_id = aws_security_group.nat_instance_sg.id
}

resource "aws_security_group_rule" "ssh_ingress_from_public_ip" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = var.private_ips_for_ssh
  security_group_id = aws_security_group.nat_instance_sg.id
}

resource "aws_security_group_rule" "ipv4_egress_from_private_subnets" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = var.private_cidr_blocks
  security_group_id = aws_security_group.nat_instance_sg.id
}

resource "aws_security_group_rule" "ssh_egress_to_private_subnets" {
  type              = "egress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = var.private_cidr_blocks
  security_group_id = aws_security_group.nat_instance_sg.id
}

resource "aws_security_group_rule" "nat_instance_output_sg_rule" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.nat_instance_sg.id
}
