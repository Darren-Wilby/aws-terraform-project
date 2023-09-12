# Current state [dev/stage/prod]

Environment = ""


# values for variables defined in './modules/vpc/variables.tf'

vpc_name           = "vpc"
availability_zones = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
vpc_cidr           = "10.0.0.0/16"
public_cidr        = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_cidr       = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]


# vales for variables defined in `./modules/security-group/variables.tf`

ip_address = "86.170.90.165"
sg_name    = "http_https_ssh_sg"


# values for variables defined in `./modules/ec2/variables.tf`

ami               = "ami-0eb260c4d5475b901"
ec2_instance_type = "t2.micro"
key_name          = "MyKeyPair"
public_ip         = true


# values for variables defined in `./modules/load-balancer/variables.tf`

lb_port = 80


# values for variables defined in `./modules/auto-scaling-group/variables.tf`

asg_instance_type = "t2.micro"