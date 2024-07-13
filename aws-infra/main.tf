module "custom_vpc" {
  source = "git::https://gitlab.com/bhattraideb/aws-terraform-modules.git//modules/aws_custom_vpc"
}

module "flask_api_ecr_repo" {
  source          = "git::https://gitlab.com/bhattraideb/aws-terraform-modules.git//modules/aws_ecr"
  repository_name = var.flask_api_repository_name
}