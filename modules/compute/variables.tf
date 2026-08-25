# ── Compute module inputs ──

variable "environment" {
  description = "Environment name, used in naming/tags"
  type        = string
}

variable "project" {
  description = "Project prefix (used by launch template and ASG)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID (from networking) — needed by SGs and target group"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnet IDs (from networking) — the ALB lives here"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "Private subnet IDs (from networking) — the ASG launches here"
  type        = list(string)
}

variable "app_instance_type" {
  description = "EC2 instance type for the app tier"
  type        = string
}

variable "certificate_arn" {
  description = "ACM certificate ARN for the HTTPS listener. Null runs HTTP-only."
  type        = string
  default     = null
}

variable "db_security_group_id" {
  description = "Database tier security group, for the app egress rule."
  type        = string
}