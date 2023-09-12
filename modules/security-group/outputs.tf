output "security_group_ids" {
    description = "ID of security groups"
    value = aws_security_group.security_group.id
}