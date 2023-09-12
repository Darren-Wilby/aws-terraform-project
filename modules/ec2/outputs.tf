output "instance_ids" {
    description = "IDs of each ec2 instance"
    value = aws_instance.ec2_instances[*].id
}