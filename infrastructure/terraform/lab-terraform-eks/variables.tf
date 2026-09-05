variable "aws_region" {
  description = "AWS region for the lab"
  type        = string
  default     = "ap-south-1"
}

variable "aws_profile" {
  description = "AWS CLI role profile used by Terraform"
  type        = string
  default     = "terraform-execution"
}

variable "project_name" {
  description = "Project/resource name prefix"
  type        = string
  default     = "lab-10-12-eks"
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Private subnet CIDRs"
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "eks_cluster_version" {
  description = "EKS Kubernetes version"
  type        = string
  default     = "1.34"
}
variable "vpc_cni_version" {
  description = "EKS VPC CNI add-on version"
  type        = string
  default     = "v1.22.4-eksbuild.3"
}

variable "coredns_version" {
  description = "EKS CoreDNS add-on version"
  type        = string
  default     = "v1.12.4-eksbuild.29"
}

variable "kube_proxy_version" {
  description = "EKS kube-proxy add-on version"
  type        = string
  default     = "v1.34.6-eksbuild.21"
}

variable "node_instance_types" {
  description = "Learning-account EC2 instance type"
  type        = list(string)
  default     = ["t3.micro"]
}

variable "node_desired_size" {
  type    = number
  default = 1
}

variable "node_min_size" {
  type    = number
  default = 1
}

variable "node_max_size" {
  type    = number
  default = 1
}

variable "dockerhub_username" {
  description = "Docker Hub username used by Tekton CI"
  type        = string
  sensitive   = true
}

variable "dockerhub_access_token" {
  description = "Docker Hub access token used by Tekton CI"
  type        = string
  sensitive   = true
}
