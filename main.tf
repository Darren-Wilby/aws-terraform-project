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

  sg_name                = var.sg_name
  allow_outgoing_traffic = var.allow_outgoing_traffic
  allow_http_traffic     = var.allow_http_traffic
  allow_https_traffic    = var.allow_https_traffic
  allow_ssh_traffic      = var.allow_ssh_traffic
  ssh_ip                 = var.ssh_ip
  vpc_id                 = module.vpc.vpc_id
}


# Create EC2 instance
module "ec2" {
  source = "./modules/ec2"

  desired_instances = var.desired_instances
  ec2_ami           = var.ec2_ami
  ec2_instance_type = var.ec2_instance_type
  ec2_key_name      = var.ec2_key_name
  ec2_public_ip     = var.ec2_public_ip
  public_subnet_ids = module.vpc.public_subnet_ids
  security_group_id = module.security_group.security_group_id
}


# Create load balancer
module "load_balancer" {
  source = "./modules/load-balancer"

  lb_name           = var.lb_name
  internal          = var.internal
  lb_type           = var.lb_type
  lb_port           = var.lb_port
  lb_protocol       = var.lb_protocol
  security_group_id = module.security_group.security_group_id
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  instance_ids      = module.ec2.instance_ids
}

# Create auto scaling group
module "auto_scaling_group" {
  source = "./modules/auto-scaling-group"

  user_data               = var.user_data
  asg_name                = var.asg_name
  asg_ami                 = var.asg_ami
  asg_instance_type       = var.asg_instance_type
  asg_key_name            = var.asg_key_name
  min_size                = var.min_size
  max_size                = var.max_size
  desired_capacity        = var.desired_capacity
  launch_template_version = var.launch_template_version
  asg_public_ip           = var.asg_public_ip
  public_subnet_ids       = module.vpc.public_subnet_ids
  security_group_id       = module.security_group.security_group_id
  target_group_arns       = [module.load_balancer.target_group_arn]
}