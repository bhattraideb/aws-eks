output "flask_api_ecr_repo_url" {
  value = module.flask_api_ecr_repo.ecr_repo_url
}

output "flask_api_ecr_repo_arn" {
  value = module.flask_api_ecr_repo.ecr_repo_arn
}

output "flask_api_ecr_repo_name" {
  value = module.flask_api_ecr_repo.ecr_repo_name
}

#output "ami_ecr_repo_url" {
#  value = module.ami_ecr_repo.ecr_repo_url
#}
#
#output "ami_ecr_repo_arn" {
#  value = module.ami_ecr_repo.ecr_repo_arn
#}
#
#output "ami_ecr_repo_name" {
#  value = module.ami_ecr_repo.ecr_repo_name
#}

#output "packer_repo_bucket" {
#  value = aws_s3_bucket.test_bucket.bucket
#}