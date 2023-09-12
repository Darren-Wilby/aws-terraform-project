# Variables used in vpc module

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
