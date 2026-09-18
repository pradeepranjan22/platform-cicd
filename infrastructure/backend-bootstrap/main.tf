# ============================================================
# AWS Account Identity
# ============================================================
# Retrieves the AWS account ID and identity information
# associated with the AWS credentials/profile being used
# by Terraform.
#
# This is used by locals.tf to generate a globally unique
# S3 bucket name for Terraform remote state.
# ============================================================

data "aws_caller_identity" "current" {}