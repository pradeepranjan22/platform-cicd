variable "aws_region" {
  description = "AWS region where the EKS cluster is running"
  type        = string
  default     = "ap-south-1"
}

variable "aws_profile" {
  description = "AWS CLI profile used to authenticate Terraform"
  type        = string
  default     = "terraform-execution"
}

variable "eks_cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "lab-10-12-eks"
}

variable "tekton_operator_version" {
  description = "Pinned Tekton Operator version"
  type        = string
  default     = "0.81.0"
}

variable "tekton_namespace" {
  description = "Namespace where Tekton Operator is installed"
  type        = string
  default     = "tekton-operator"
}

variable "tekton_pipeline_namespace" {
  description = "Namespace where Tekton Pipelines components are installed"
  type        = string
  default     = "tekton-pipelines"
}