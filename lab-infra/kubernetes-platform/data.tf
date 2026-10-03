data "terraform_remote_state" "aws_foundation" {
  backend = "s3"

  config = {
    bucket = var.aws_foundation_state_bucket
    key    = var.aws_foundation_state_key
    region = var.aws_region
  }
}