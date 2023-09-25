# Variables for creating VPC
vpc_name           = "my-vpc"
availability_zones = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
vpc_cidr           = "10.0.0.0/16"
public_cidr        = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_cidr       = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]


# Variables for creating security group
sg_name                = "my-security-group"
ssh_ip                 = "86.170.90.165" # Replace with your IPv4 address
allow_outgoing_traffic = true
allow_http_traffic     = true
allow_https_traffic    = true
allow_ssh_traffic      = true


# Variables for creating ec2 instances
desired_instances = 0
ec2_ami           = "ami-0eb260c4d5475b901"
ec2_instance_type = "t2.micro"
ec2_key_name      = "MyKeyPair"
ec2_public_ip     = true


# Variables for creating load balancer
lb_name     = "my-lb"
internal    = false
lb_type     = "application"
lb_port     = 80
lb_protocol = "HTTP"


# Variables for creating auto scaling group
asg_name                = "my-asg"
asg_ami                 = "ami-0eb260c4d5475b901"
asg_instance_type       = "t2.micro"
asg_key_name            = "MyKeyPair"
min_size                = 0
max_size                = 3
desired_capacity        = 3
launch_template_version = "$Latest"
asg_public_ip           = true
user_data               = "./user_data.tpl"
