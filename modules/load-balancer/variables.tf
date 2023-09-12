# variables used in load balancer module

variable "lb_port" {
  description = "The port number of the load balancer"
  type        = number
}


# output from `~/modules/security-group/outputs.tf`

variable "security_group_ids" {
  description = "ID of the security groups"
  type        = list(string)
}


# output from `~/modules/vpc/outputs.tf`

variable "vpc_id" {
  description = "ID of the created VPC"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}


# output from `~/modules/ec2/outputs.tf`

variable "instance_ids" {
  description = "IDs of each ec2 instance"
  type        = list(string)
}
