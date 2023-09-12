resource "aws_launch_template" "launch_template" {
  instance_type = "t2.micro"
  image_id = "ami-0eb260c4d5475b901"
  key_name = "MyKeyPair"
  #subnet_id = var.public_subnet_ids[0]
  #associate_public_ip_address = true
  vpc_security_group_ids = var.security_group_ids

  user_data = base64encode(file("./nginx/userdata.tpl"))
}

resource "aws_autoscaling_group" "asg" {
  min_size                  = 3
  max_size                  = 3
  desired_capacity          = 3
  vpc_zone_identifier      = var.public_subnet_ids
  launch_template {
    id      = aws_launch_template.launch_template.id
    version = "$Latest"
  }
}

resource "aws_autoscaling_policy" "policy" {
  name = "policy"
  scaling_adjustment = 1
  adjustment_type = "ChangeInCapacity"
  autoscaling_group_name = aws_autoscaling_group.asg.name
}
