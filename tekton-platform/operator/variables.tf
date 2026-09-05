variable "aws_region" {
  description = "AWS region where the EKS cluster is running"
  type        = string
  default     = "ap-south-1"
}

variable "aws_profile" {
  description = "AWS CLI profile used by Terraform"
  type        = string
  default     = "terraform-execution"
}

variable "eks_cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "lab-10-12-eks"
}

variable "tekton_operator_version" {
  description = "Tekton Operator version"
  type        = string
  default     = "v0.81.0"
}

variable "operator_manifest_file" {
  description = "Path to the pinned Tekton Operator release manifest"
  type        = string
  default     = "manifests/tekton-operator.yaml"
}