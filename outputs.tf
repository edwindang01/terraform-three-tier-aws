# ── Root outputs ──
# Re-expose selected module outputs so they print on `terraform output`.
# A child module's output is NOT shown on the CLI unless the root surfaces it.

output "vpc_id" {
  description = "VPC ID"
  value       = module.network.vpc_id
}

output "alb_dns_name" {
  description = "Public DNS of the ALB — hit this in a browser"
  value       = module.compute.alb_dns_name
}

output "db_endpoint" {
  description = "RDS connection endpoint"
  value       = module.database.db_endpoint
}
