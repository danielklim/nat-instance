data "aws_ami" "amzn_linux_2023_ami" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_instance" "nat_aws_instances" {
  count                       = length(var.public_subnet_ids)
  ami                         = data.aws_ami.amzn_linux_2023_ami.id
  instance_type               = "t2.micro"
  subnet_id                   = element(var.public_subnet_ids[*], count.index)
  vpc_security_group_ids      = [aws_security_group.nat_instance_sg.id]
  associate_public_ip_address = true
  source_dest_check           = false
  user_data_replace_on_change = true
  key_name                    = var.ec2_key_name

  root_block_device {
    volume_size = "8"
    volume_type = "gp2"
    encrypted   = true
  }

  tags = (merge(
    var.tags,
    {
      Name = "NAT EC2 Instance ${count.index + 1}"
    }
  ))

  # this is sensitive to the interface name
  # consider somehting like this as well: https://github.com/int128/terraform-aws-nat-instance/issues/65
  user_data = <<-EOL
                                        #! /bin/bash
                                        sudo yum install iptables-services -y
                                        sudo systemctl enable iptables
                                        sudo systemctl start iptables
                                        sudo sysctl -w net.ipv4.ip_forward=1
                                        sudo /sbin/iptables -t nat -A POSTROUTING -o enX0 -j MASQUERADE
                                        sudo /sbin/iptables -F FORWARD
    EOL
}
