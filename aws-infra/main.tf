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
