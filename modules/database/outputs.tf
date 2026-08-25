# ── Database module outputs ──

output "db_endpoint" {
  description = "RDS connection endpoint (host:port) — what an app would connect to"
  value       = aws_db_instance.main.endpoint
}

output "security_group_id" {
  description = "Database SG, for cross-tier rules wired at the root"
  value       = aws_security_group.database.id
}