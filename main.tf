# Create VPC
module "vpc" {
  source = "./modules/vpc"

  vpc_name           = var.vpc_name
  availability_zones = var.availability_zones
  vpc_cidr           = var.vpc_cidr
  public_cidr        = var.public_cidr
  private_cidr       = var.private_cidr
}

# Create security group
module "security_group" {
  source = "./modules/security-group"

  sg_name    = var.sg_name
  vpc_id     = module.vpc.vpc_id
  ip_address = var.ip_address
}

# Create EC2 instance
module "ec2" {
  source = "./modules/ec2"

  ami                = var.ami
  ec2_instance_type  = var.ec2_instance_type
  key_name           = var.key_name
  public_ip          = var.public_ip
  public_subnet_ids  = module.vpc.public_subnet_ids
  security_group_ids = module.security_group.security_group_ids
}

# Create load balancer
module "load_balancer" {
  source = "./modules/load-balancer"

  lb_port            = var.lb_port
  instance_ids       = module.ec2.instance_ids
  security_group_ids = [module.security_group.security_group_ids]
  vpc_id             = module.vpc.vpc_id
  public_subnet_ids  = module.vpc.public_subnet_ids
}

# Create auto scaling group
module "auto_scaling_group" {
  source = "./modules/auto-scaling-group"

  asg_instance_type = var.asg_instance_type
  public_subnet_ids = module.vpc.public_subnet_ids
  security_group_ids = [module.security_group.security_group_ids]
}