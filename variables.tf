# Variables used to create VPC
variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
  default     = "my_vpc"
}

variable "availability_zones" {
  description = "A list of availability zones for the VPC."
  type        = list(string)
  default     = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_cidr" {
  description = "A list of CIDR blocks for the public subnets."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_cidr" {
  description = "A list of CIDR blocks for the private subnets."
  type        = list(string)
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}


# Variables used to create Security Groups
variable "sg_name" {
  description = "A user-defined name for the security group."
  type        = string
  default     = "my-security-group"
}

variable "ssh_ip" {
  description = "Allowed source IP address for incoming SSH traffic."
  type        = string
  default     = "86.170.90.165/24"
}

variable "allow_outgoing_traffic" {
  description = "Flag to allow all outgoing traffic (true or false)."
  type        = bool
  default     = true
}

variable "allow_http_traffic" {
  description = "Flag to allow incoming HTTP traffic (true or false)."
  type        = bool
  default     = true
}

variable "allow_https_traffic" {
  description = "Flag to allow incoming HTTPS traffic (true or false)."
  type        = bool
  default     = true
}

variable "allow_ssh_traffic" {
  description = "Flag to allow incoming SSH traffic (true or false)."
  type        = bool
  default     = true
}


# Variables used to create ec2 instances
variable "desired_instances" {
  description = "The desired number of EC2 instances."
  type        = number
}

variable "ec2_ami" {
  description = "The ID of the AMI to use for the EC2 instance."
  type        = string
  default     = "ami-0eb260c4d5475b901"
}

variable "ec2_instance_type" {
  description = "The type for the EC2 instance."
  type        = string
  default     = "t2.micro"
}

variable "ec2_key_name" {
  description = "The name of the SSH key pair used for authentication."
  type        = string
  default     = "MyKeyPair"
}

variable "ec2_public_ip" {
  description = "Whether to associate a public IP address with the EC2 instance (true/false)."
  type        = bool
  default     = true
}


# Variables used to create Load Balancer and Target Groups
variable "lb_name" {
  description = "The name of the load balancer."
  type        = string
  default     = "my_lb"
}

variable "internal" {
  description = "Whether the load balancer is internal (true/false)."
  type        = bool
  default     = false
}

variable "lb_type" {
  description = "The type of the load balancer (e.g., 'application', 'network')."
  type        = string
  default     = "application"
}

variable "lb_port" {
  description = "The port on which the load balancer listens."
  type        = number
  default     = 80
}

variable "lb_protocol" {
  description = "The protocol used by the load balancer (e.g., 'HTTP', 'HTTPS', 'TCP', 'UDP')."
  type        = string
  default     = "HTTP"
}


# Variables used to create Auto Scaling Group
variable "asg_name" {
  description = "The name of the Auto Scaling Group."
  type        = string
  default     = "my-asg"
}

variable "asg_instance_type" {
  description = "The instance type for the autoscaling group."
  type        = string
  default     = "t2.micro"
}

variable "asg_ami" {
  description = "The ID of the AMI to use for the launch template."
  type        = string
  default     = "ami-0eb260c4d5475b901"
}

variable "asg_key_name" {
  description = "The name of the EC2 key pair to use for the launch template."
  type        = string
  default     = "MyKeyPair"
}

variable "min_size" {
  description = "The minimum size of the autoscaling group."
  type        = number
  default     = 1
}

variable "max_size" {
  description = "The maximum size of the autoscaling group."
  type        = number
  default     = 3
}

variable "desired_capacity" {
  description = "The desired capacity of the autoscaling group."
  type        = number
  default     = 2
}

variable "launch_template_version" {
  description = "The version of the launch template to use in the autoscaling group."
  type        = string
  default     = "$Latest"
}

variable "asg_public_ip" {
  description = "Whether to associate a public IP address with the EC2 instance (true/false)."
  type        = bool
  default     = true
}

variable "user_data" {
  description = "Path to user data file to use in the launch template."
  type        = string
  default     = null
}