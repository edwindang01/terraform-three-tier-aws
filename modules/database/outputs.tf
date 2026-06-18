# ── Database module outputs ──

output "db_endpoint" {
  description = "RDS connection endpoint (host:port) — what an app would connect to"
  value       = aws_db_instance.main.endpoint
}
