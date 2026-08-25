# ── Database module ──
# DB security group, DB subnet group, Multi-AZ Postgres RDS instance.
# vpc_id, database_subnet_ids (from networking) 
# arrive as inputs via the root.

resource "aws_security_group" "database" {
  name        = "${var.environment}-db-sg"
  description = "security group for RDS database"
  vpc_id      = var.vpc_id

  tags = {
    Name        = "${var.environment}-db-sg"
    Environment = var.environment
  }
}

resource "aws_db_subnet_group" "main" {
  name       = "${var.environment}-db-subnet-group"
  subnet_ids = var.database_subnet_ids

  tags = {
    Name        = "${var.environment}-db-subnet-group"
    Environment = var.environment
  }
}

resource "aws_db_instance" "main" {
  identifier                 = "${var.environment}-postgres"
  engine                     = "postgres"
  engine_version             = "16"
  auto_minor_version_upgrade = true
  instance_class             = "db.t3.micro"

  allocated_storage = 20
  storage_type      = "gp3"
  storage_encrypted = true

  db_name  = "appdb"
  username = var.db_username

  manage_master_user_password = true

  multi_az               = true
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.database.id]

  skip_final_snapshot = true
  deletion_protection = false

  tags = {
    Name        = "${var.environment}-postgres"
    Environment = var.environment
  }
}
