# variables used in security group module

variable "sg_name" {
    description = "Name of security group"
    type = string
}

variable "ip_address" {
    description = "Your IP address"
    type = string
}


# output from `~/modules/vpc/outputs.tf`

variable "vpc_id" {
    description = "ID of the VPC"
    type = string
}