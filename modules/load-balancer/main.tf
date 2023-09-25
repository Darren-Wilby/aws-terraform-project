# Load balancer
resource "aws_lb" "main" {
  name               = var.lb_name
  internal           = var.internal
  load_balancer_type = var.lb_type
  security_groups    = [var.security_group_id]
  subnets            = var.public_subnet_ids
}

# Listener for ALB
resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.main.arn
  port              = var.lb_port
  protocol          = var.lb_protocol

  default_action {
    target_group_arn = aws_lb_target_group.main.arn
    type             = "forward"
  }
}

# Target group for instances
resource "aws_lb_target_group" "main" {
  port     = var.lb_port
  protocol = var.lb_protocol
  vpc_id   = var.vpc_id
}

# Attach instances to target group
resource "aws_lb_target_group_attachment" "main" {
  count            = length(var.instance_ids)
  target_group_arn = aws_lb_target_group.main.arn
  port             = var.lb_port
  target_id        = var.instance_ids[count.index]
}