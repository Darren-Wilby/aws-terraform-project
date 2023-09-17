# Output(s) from security group module

output "security_group_ids" {
    description = "List of IDs for the created security groups"
    value = aws_security_group.security_group.id
}