module "custom_vpc" {
  source = "git::https://gitlab.com/bhattraideb/aws-terraform-modules.git//modules/aws_custom_vpc"
  environment = var.environment
}

module "aws_ecr_repo" {
  source          = "git::https://gitlab.com/bhattraideb/aws-terraform-modules.git//modules/aws_ecr"
  repository_name = var.flask_api_repository_name
}

module "aws_eks_cluster" {
  source = "git::https://gitlab.com/bhattraideb/aws-terraform-modules.git//modules/aws_eks_cluster"
  eks_cluster_role_name = var.eks_cluster_role_name
  eks_cluster_name = var.eks_cluster_name
  subnet_ids = [module.custom_vpc.public_a_subnet_id, module.custom_vpc.public_b_subnet_id]
}

module "aws_database_instance" {
  source = "git::https://gitlab.com/bhattraideb/aws-terraform-modules.git//modules/aws_database"
  db_identifier_name          = var.db_identifier_name
  database_name               = var.database_name
  storage_type                = var.storage_type
  storage                     = var.storage
  max_allocated_storage       = var.max_allocated_storage
  username                    = var.username
  engine                      = var.engine
  engine_family               = var.engine_family
  engine_version              = var.engine_version
  instance_type               = var.db_instance_type
  multi_az                    = var.multi_az
  vpc_id                      = module.custom_vpc.vpc_id
  encryption_at_rest          = var.encryption_at_rest
  backup_retention_period     = var.backup_retention_period
  performance_insight_enabled = var.performance_insight_enabled
  deletion_protection         = var.deletion_protection
  ingress_security_groups     = var.ingress_security_groups
  subnet_ids                  = [module.custom_vpc.private_a_subnet_id, module.custom_vpc.private_b_subnet_id]
}