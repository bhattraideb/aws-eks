variable "managed_by" {
  type        = string
  description = "Project Infrastructure Managed By"
  default     = "Terraform"
}

variable "project" {
  type        = string
  description = "Project name"
  default     = "Kubernetes deployment"
}

variable "owner" {
  type        = string
  description = "Project owner"
  default     = "Deb Bhattrai"
}

variable "environment" {
  type        = string
  description = "Infrastructure description"
  default     = "Development"
}

variable "AWS_REGION" {
  type        = string
  description = "Region"
  default     = "us-east-1"
}

#
# variable "web_security_group_name" {
#   type        = string
#   description = "Security group for EC2 to be launched"
#   default = "WebAccess"
# }
#
# variable "api_security_group_name" {
#   type        = string
#   description = "Security group for EC2 to be launched"
#   default = "APIAccess"
# }

variable "flask_api_repository_name" {
  type        = string
  description = "Flask API repo name deployed from GitHub"
  default     = "kubernetes-flask-api-images"
}

variable "ecs_application_port" {
  type        = string
  description = "Port the Flask APP runs on docker"
  default     = "5000"
}

variable "docker_app_name" {
  type        = string
  description = "Name of Docker App"
  default     = "flask-api"
}

