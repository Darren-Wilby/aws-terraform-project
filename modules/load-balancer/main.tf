# target group for instances
resource "aws_lb_target_group" "nginx_target_group" {
  port            = var.lb_port
  protocol        = "HTTP"
  target_type     = "instance"
  vpc_id          = var.vpc_id
  
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
    path                = "/"
    matcher             = "200,302"
  }
}

# load balancer
resource "aws_lb" "nginx_lb" {
  name = "nginx-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups   = var.security_group_ids
  subnets           = var.public_subnet_ids
}

# attach instances to target group
resource "aws_lb_target_group_attachment" "tg" {
  count = length(var.instance_ids)

  target_group_arn = aws_lb_target_group.nginx_target_group.arn
  target_id        = var.instance_ids[count.index]
  port             = var.lb_port
}

# listener for ALB
resource "aws_lb_listener" "nginx_listener" {
  load_balancer_arn = aws_lb.nginx_lb.arn
  port              = var.lb_port
  protocol          = "HTTP"
  
  default_action {
    target_group_arn = aws_lb_target_group.nginx_target_group.arn
    type             = "forward"
  }
}
