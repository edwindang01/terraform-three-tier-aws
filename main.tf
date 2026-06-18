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

  environment        = var.environment
  project            = var.project
  app_instance_type  = var.app_instance_type
  vpc_id             = module.network.vpc_id             # from networking
  public_subnet_ids  = module.network.public_subnet_ids  # from networking
  private_subnet_ids = module.network.private_subnet_ids # from networking
}

module "database" {
  source = "./modules/database"

  environment         = var.environment
  db_username         = var.db_username
  vpc_id              = module.network.vpc_id              # from networking
  database_subnet_ids = module.network.database_subnet_ids # from networking
  app_sg_id           = module.compute.app_sg_id           # from COMPUTE
}
