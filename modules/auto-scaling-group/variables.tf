# Variables used in the Auto Scaling Group module
variable "asg_name" {
  description = "The name of the Auto Scaling Group."
  type        = string
}

variable "asg_instance_type" {
  description = "The instance type for the autoscaling group."
  type        = string
}

variable "asg_ami" {
  description = "The ID of the AMI to use for the launch template."
  type        = string
}

variable "asg_key_name" {
  description = "The name of the EC2 key pair to use for the launch template."
  type        = string
}

variable "min_size" {
  description = "The minimum size of the autoscaling group."
  type        = number
}

variable "max_size" {
  description = "The maximum size of the autoscaling group."
  type        = number
}

variable "desired_capacity" {
  description = "The desired capacity of the autoscaling group."
  type        = number
}

variable "launch_template_version" {
  description = "The version of the launch template to use in the autoscaling group."
  type        = string
}

variable "asg_public_ip" {
  description = "Whether to associate a public IP address with the EC2 instance (true/false)."
  type        = bool
}

variable "user_data" {
  description = "Path to user data file to use in the launch template."
  type        = string
}

# Output(s) from VPC module
variable "public_subnet_ids" {
  description = "A list of IDs for the public subnets within the VPC."
  type        = list(string)
}

# Output(s) from Security Group module
variable "security_group_id" {
  description = "ID for the created security group."
  type        = string
}
# Output(s) from Load Balancer module
variable "target_group_arns" {
  description = "List of target group ARNs to attach the instances to."
  type        = list(string)
}