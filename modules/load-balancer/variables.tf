# Variables for Load Balancer and Target Group
variable "lb_name" {
  description = "The name of the load balancer."
  type        = string
}

variable "internal" {
  description = "Whether the load balancer is internal (true/false)."
  type        = bool
}

variable "lb_type" {
  description = "The type of the load balancer (e.g., 'application', 'network')."
  type        = string
}

variable "lb_port" {
  description = "The port on which the load balancer listens."
  type        = number
}

variable "lb_protocol" {
  description = "The protocol used by the load balancer (e.g., 'HTTP', 'HTTPS', 'TCP', 'UDP')."
  type        = string
}

# Output(s) from the Security Group module
variable "security_group_id" {
  description = "ID for the created security group."
  type        = string
}

# Output(s) from the VPC module
variable "vpc_id" {
  description = "ID of the created VPC"
  type        = string
}

variable "public_subnet_ids" {
  description = "A list of IDs for the public subnets within the VPC."
  type        = list(string)
}

# Outout(s) from the ec2 module
variable "instance_ids" {
  description = "List of IDs of each ec2 instance"
  type        = list(string)
}