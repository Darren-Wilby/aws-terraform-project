# Variables used in security group module
variable "sg_name" {
  description = "A user-defined name for the security group."
  type        = string
}

variable "ssh_ip" {
  description = "Allowed source IP address for incoming SSH traffic."
  type        = string
}

variable "allow_outgoing_traffic" {
  description = "Flag to allow all outgoing traffic (true or false)."
  type        = bool
}

variable "allow_http_traffic" {
  description = "Flag to allow incoming HTTP traffic (true or false)."
  type        = bool
}

variable "allow_https_traffic" {
  description = "Flag to allow incoming HTTPS traffic (true or false)."
  type        = bool
}

variable "allow_ssh_traffic" {
  description = "Flag to allow incoming SSH traffic (true or false)."
  type        = bool
}


# Output(s) from the VPC module
variable "vpc_id" {
  description = "ID of the created VPC"
  type        = string
}