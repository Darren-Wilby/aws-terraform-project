# Output(s) from the VPC module
output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "A list of IDs for the public subnets within the VPC."
  value       = aws_subnet.public[*].id
}
