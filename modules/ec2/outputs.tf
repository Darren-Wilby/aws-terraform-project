# Output(s) from ec2 modules
output "instance_ids" {
  description = "List of IDs of each ec2 instance"
  value       = aws_instance.ec2_instances[*].id
}