terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.60"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = "tf-user-for-test"
  default_tags {
    tags = {
      Environment = var.environment
      Project     = var.project
      Owner       = var.owner
      ManagedBy   = var.managed_by
    }
  }
}
