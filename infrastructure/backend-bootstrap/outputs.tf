output "state_bucket_name" {
  description = "Name of the S3 bucket used for Terraform remote state."
  value       = aws_s3_bucket.terraform_state.bucket
}

output "state_bucket_arn" {
  description = "ARN of the Terraform state S3 bucket."
  value       = aws_s3_bucket.terraform_state.arn
}

output "state_key" {
  description = "S3 object key used for the Terraform state."
  value       = local.state_key
}

output "aws_region" {
  description = "AWS region containing the Terraform backend."
  value       = var.aws_region
}

output "terraform_backend_configuration" {
  description = "Backend configuration values required by the Lab 10.12 root configuration."
  value = {
    bucket       = aws_s3_bucket.terraform_state.bucket
    key          = local.state_key
    region       = var.aws_region
    use_lockfile = true
    encrypt      = true
  }
}