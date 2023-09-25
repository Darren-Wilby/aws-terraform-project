# Output(s) from security group module
output "security_group_id" {
  description = "ID for the created security group."
  value       = aws_security_group.security_group.id
}