variable "aws_region" {
  description = "AWS region where the Terraform backend resources will be created."
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project name used for resource naming and tagging."
  type        = string
  default     = "lab-10-12-eks"
}

variable "environment" {
  description = "Environment name."
  type        = string
  default     = "lab"
}

variable "state_bucket_prefix" {
  description = "Prefix used to generate the globally unique S3 state bucket name."
  type        = string
  default     = "pranjan-terraform-state"
}

