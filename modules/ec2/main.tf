# AWS EC2 Instances
resource "aws_instance" "ec2_instances" {
  count                       = var.desired_instances
  ami                         = var.ec2_ami
  instance_type               = var.ec2_instance_type
  subnet_id                   = var.public_subnet_ids[count.index]
  key_name                    = var.ec2_key_name
  associate_public_ip_address = var.ec2_public_ip
  vpc_security_group_ids      = [var.security_group_id]

  tags = {
    Name = "ec2-instance-${count.index + 1}"
  }
}