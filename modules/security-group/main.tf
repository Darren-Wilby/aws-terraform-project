resource "aws_security_group" "security_group" {
  name = var.sg_name

  # Allow incoming HTTP (port 80) traffic
  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow incoming HTTPS (port 443) traffic
  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow incoming SSH traffic from your IP address
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.ip_address}/32"]
  }

  # Allow all outgoing traffic
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Apply the security group to specific subnets
  vpc_id = var.vpc_id
}
