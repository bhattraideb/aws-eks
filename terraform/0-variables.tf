variable "managed_by" {
  type        = string
  description = "Project Infrastructure Managed By"
  default     = "Terraform"
}

variable "project" {
  type        = string
  description = "Project name"
  default     = "EKS"
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

variable "zone1" {
  type        = string
  description = "Availability Zone 1"
  default     = "us-east-1a"
}

variable "zone2" {
  type        = string
  description = "Availability Zone 2"
  default     = "us-east-1b"
}

variable "eks_name" {
  type        = string
  description = "Region"
  default     = "demo"
}

# https://docs.aws.amazon.com/eks/latest/userguide/kubernetes-versions.html#available-versions
variable "eks_version" {
  type        = string
  description = "Latest version of EKS"
  default     = "1.30"
}


variable "eks_developer_user" {
  type        = string
  description = "Developer user name for EKS"
  default     = "eks-developer"
}

variable "eks_manager" {
  type        = string
  description = "Admin user name for EKS"
  default     = "eks-manager"
}

variable "region" {
  type        = string
  description = "Region"
  default     = "us-east-1"
}

variable "flask_api_repository_name" {
  type        = string
  description = "Flask API repo name deployed from GitHub"
  default     = "kubernetes-flask-api"
}
