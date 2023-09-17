resource "aws_security_group" "security_group" {
  name = var.sg_name

  # Conditionally allow incoming HTTP (port 80) traffic
  dynamic "ingress_http" {
    for_each = var.allow_http_traffic ? [1] : []
    content {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  # Conditionally allow incoming HTTPS (port 443) traffic
  dynamic "ingress_https" {
    for_each = var.allow_https_traffic ? [1] : []
    content {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  # Conditionally allow incoming SSH traffic
  dynamic "ingress_ssh" {
    for_each = var.allow_ssh_traffic ? [1] : []
    content {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = [var.ssh_ip]
    }
  }

  # Conditionally allow outgoing traffic
  dynamic "egress_traffic" {
    for_each = var.allow_outgoing_traffic ? [1] : []
    content {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  # Apply the security group to specific subnets
  vpc_id = var.vpc_id
}
