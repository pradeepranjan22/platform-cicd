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
  description = "EKS cluster where Argo CD will be installed"
  type        = string
  default     = "lab-10-12-eks"
}

variable "argocd_namespace" {
  description = "Kubernetes namespace where Argo CD is installed"
  type        = string
  default     = "argocd"
}

variable "argocd_chart_version" {
  description = "Pinned Argo CD Helm chart version"
  type        = string
  default     = "10.4.0"
}