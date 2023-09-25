# Variables used in VPC module
variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
}

variable "availability_zones" {
  description = "A list of availability zones for the VPC."
  type        = list(string)
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "public_cidr" {
  description = "A list of CIDR blocks for the public subnets."
  type        = list(string)
}

variable "private_cidr" {
  description = "A list of CIDR blocks for the private subnets."
  type        = list(string)
}
