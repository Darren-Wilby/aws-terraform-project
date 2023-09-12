variable "Environment" {
  description = "Current remote state"
  type        = string
}


# Variables used to create VPC in `./main.tf`

variable "vpc_name" {
  description = "Name of VPC"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_cidr" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_cidr" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}


# variables used to create security groups in `./main.tf`

variable "sg_name" {
  description = "Name of security group"
  type        = string
}

variable "ip_address" {
  description = "Your IP address"
  type        = string
}


# variables used to create ec2 instance in `./main.tf`

variable "ami" {
  description = "ID of AMI"
  type        = string
}

variable "ec2_instance_type" {
  description = "Type of instance"
  type        = string
}

variable "key_name" {
  description = "Name of key"
  type        = string
}

variable "public_ip" {
  description = "Decides whether public IP address will be assigned"
  type        = bool
}


# variables used to create load balancer in `./main.tf`

variable "lb_port" {
  description = "The port number of the load balancer"
  type        = number
}

variable "asg_instance_type" {
  description = "Type of instance for auto scaling group"
  type        = string
}