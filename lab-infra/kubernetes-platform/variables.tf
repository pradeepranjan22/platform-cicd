variable "environment" {
  description = "Kubernetes platform environment"
  type        = string
  default     = "dev"
}

variable "aws_region" {
  description = "AWS region where the EKS cluster is deployed"
  type        = string
  default     = "ap-south-1"
}

variable "aws_foundation_state_bucket" {
  description = "S3 bucket containing the AWS Foundation Terraform state"
  type        = string
}

variable "aws_foundation_state_key" {
  description = "S3 key containing the AWS Foundation Terraform state"
  type        = string
  default     = "aws-foundation/terraform.tfstate"
}