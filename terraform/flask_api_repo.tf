module "flask_repo" {
  source          = "git::https://gitlab.com/bhattraideb/aws-terraform-modules.git//modules/aws_ecr?ref=main"
  repository_name = var.flask_api_repository_name
  force_delete = true
}