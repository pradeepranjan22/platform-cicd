locals {
  state_bucket_name = "${var.state_bucket_prefix}-${data.aws_caller_identity.current.account_id}"

  state_key = "platform/lab-10-12/terraform.tfstate"

  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform-bootstrap"
  }

  state_bucket_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform-bootstrap"
    Purpose     = "terraform-state"
  }
}