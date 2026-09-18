provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      ManagedBy   = "terraform-bootstrap"
      Project     = var.project_name
      Environment = var.environment
    }
  }
}
