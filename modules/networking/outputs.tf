# ── Networking module outputs ──
# The ONLY values visible outside this module. The root reads these as
# module.network.<name> and passes them into compute and database.

output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets (for the ALB)"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "IDs of the private subnets (for the ASG)"
  value       = aws_subnet.private[*].id
}

output "database_subnet_ids" {
  description = "IDs of the database subnets (for the RDS subnet group)"
  value       = aws_subnet.database[*].id
}
