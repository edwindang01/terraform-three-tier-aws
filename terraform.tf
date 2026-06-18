# ── Root: backend + provider ──
# The backend lives ONLY at the root. Modules never declare their own backend;
# all state is managed here, in the S3 bucket created by the bootstrap project.

terraform {
  backend "s3" {
    bucket       = "tf-state-711427856227-ap-southeast-1-v2"
    key          = "app/terraform.tfstate"
    region       = "ap-southeast-1"
    encrypt      = true
    use_lockfile = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.100"
    }
  }
}

provider "aws" {
  region = var.region
}
