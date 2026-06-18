# ── Database module inputs ──

variable "environment" {
  description = "Environment name, used in naming/tags"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID (from networking) — needed by the DB security group"
  type        = string
}

variable "database_subnet_ids" {
  description = "Database subnet IDs (from networking) — builds the DB subnet group"
  type        = list(string)
}

variable "app_sg_id" {
  description = "App tier SG ID (from compute) — DB ingress allows Postgres from it"
  type        = string
}

variable "db_username" {
  description = "RDS master username"
  type        = string
}
