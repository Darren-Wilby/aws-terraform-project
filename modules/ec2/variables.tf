# Variables used in the EC2 module
variable "desired_instances" {
  description = "The desired number of EC2 instances."
  type        = number
}

variable "ec2_ami" {
  description = "The ID of the AMI to use for the EC2 instance."
  type        = string
}

variable "ec2_instance_type" {
  description = "The type of EC2 instance to launch."
  type        = string
}

variable "ec2_key_name" {
  description = "The name of the SSH key pair used for authentication."
  type        = string
}

variable "ec2_public_ip" {
  description = "Whether to associate a public IP address with the EC2 instance (true/false)."
  type        = bool
}


# Output(s) from the VPC module
variable "public_subnet_ids" {
  description = "A list of IDs for the public subnets within the VPC."
  type        = list(string)
}


# Output(s) from the security group module
variable "security_group_id" {
  description = "ID for the created security group."
  type        = string
}
