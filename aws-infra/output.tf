output "vpc_public_subnet_ids" {
  value = [module.custom_vpc.public_a_subnet_id, module.custom_vpc.public_b_subnet_id]
}

output "cluster_endpoint" {
  value = module.aws_eks_cluster.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = module.aws_eks_cluster.kubeconfig-certificate-authority-data
}

output "ecr_repo_url" {
  value = module.aws_ecr_repo.ecr_repo_url
}

output "ecr_repo_arn" {
  value = module.aws_ecr_repo.ecr_repo_arn
}

output "ecr_repo_name" {
  value = module.aws_ecr_repo.ecr_repo_name
}
