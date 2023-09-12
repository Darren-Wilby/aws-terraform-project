variable "asg_instance_type" {
    description = "Type of instance used for auto scaling group"
    type = string
}

# outputs from `./modules/vpc/outputs.tf`

variable "public_subnet_ids" {
    description = "IDs of public subnets"
    type = list(string)
}


# output from `~/modules/security-group/outputs.tf`

variable "security_group_ids" {
  description = "ID of the security groups"
  type        = list(string)
}