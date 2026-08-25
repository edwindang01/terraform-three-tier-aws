# ── Root: the orchestrator ──
# Calls the three modules and wires them together. This is the ONLY place that
# knows about all three; the modules never reference each other directly.

module "network" {
  source = "./modules/networking"

  environment = var.environment
  vpc_cidr    = var.vpc_cidr
}

module "compute" {
  source = "./modules/compute"

  environment          = var.environment
  project              = var.project
  app_instance_type    = var.app_instance_type
  vpc_id               = module.network.vpc_id             # from networking
  public_subnet_ids    = module.network.public_subnet_ids  # from networking
  private_subnet_ids   = module.network.private_subnet_ids # from networking
}

module "database" {
  source = "./modules/database"

  environment         = var.environment
  db_username         = var.db_username
  vpc_id              = module.network.vpc_id              # from networking
  database_subnet_ids = module.network.database_subnet_ids # from networking
}

resource "aws_vpc_security_group_egress_rule" "app_to_db" {
  security_group_id            = module.compute.app_security_group_id
  description                  = "postgres to database tier"
  referenced_security_group_id = module.database.security_group_id
  from_port                    = 5432
  to_port                      = 5432
  ip_protocol                  = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "db_from_app" {
  security_group_id            = module.database.security_group_id
  description                  = "postgres from app tier"
  referenced_security_group_id = module.compute.app_security_group_id
  from_port                    = 5432
  to_port                      = 5432
  ip_protocol                  = "tcp"
}