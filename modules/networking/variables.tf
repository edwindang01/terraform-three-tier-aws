# ── Networking module inputs ──
# These are the "slots" the root must fill when calling this module.

variable "environment" {
  description = "Environment name, used in resource naming/tags"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}
