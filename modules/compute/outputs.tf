# ── Compute module outputs ──

output "app_sg_id" {
  description = "App tier security group ID — consumed by the database module"
  value       = aws_security_group.app.id
}

output "alb_dns_name" {
  description = "Public DNS of the ALB — surfaced to the root to hit in a browser"
  value       = aws_lb.app.dns_name
}
