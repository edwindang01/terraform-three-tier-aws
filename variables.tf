# ── Root variables ──
# These hold the defaults. The root passes them down into the modules, whose
# own variable blocks have NO defaults (they require the root to supply values).

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "region" {
  description = "AWS Region"
  type        = string
  default     = "ap-southeast-1"
}

variable "project" {
  description = "Project name prefix for resource naming"
  type        = string
  default     = "three-tier"
}

variable "app_instance_type" {
  description = "EC2 instance type for app tier"
  type        = string
  default     = "t3.micro"
}

variable "db_username" {
  description = "RDS master username"
  type        = string
  default     = "dbadmin"
}
