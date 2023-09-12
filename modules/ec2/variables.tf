# output from `~/modules/vpc/outputs.tf`

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

# output from `~/modules/security-group/outputs.tf`

variable "security_group_ids" {
  description = "ID of the security group"
  type        = string
}


# variables used in ec2 module

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
