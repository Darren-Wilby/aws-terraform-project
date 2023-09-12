resource "aws_instance" "ec2_instances" {
  count         = length(var.public_subnet_ids)
  ami           = var.ami
  instance_type = var.ec2_instance_type
  subnet_id     = var.public_subnet_ids[count.index]
  key_name      = var.key_name
  associate_public_ip_address = var.public_ip
  vpc_security_group_ids = [var.security_group_ids]

  user_data = file("./nginx/userdata.tpl")

  tags = {
    Name = "ec2-instance-${count.index + 1}"
  }
}