# Output(s) from the Load Balancer module
output "target_group_arn" {
  description = "ARN of the target group."
  value       = aws_lb_target_group.main.arn
}