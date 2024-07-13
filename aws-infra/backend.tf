terraform {
  backend "s3" {
    bucket  = "terraform-course-global-state"
    key     = "devops/kubernetes"
    region  = "us-east-1"
    profile = "tf-user-for-test"
  }
}