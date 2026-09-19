resource "aws_dynamodb_table" "terraform_state_lock" {
  name         = "pranjan-terraform-state-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "pranjan-terraform-state-lock"
    ManagedBy   = "terraform-bootstrap"
    Project     = var.project_name
    Environment = var.environment
  }
}