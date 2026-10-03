# ============================================================
# AWS Foundation Outputs
# ============================================================

output "aws_region" {
  description = "AWS region where the foundation infrastructure is deployed"
  value       = var.aws_region
}

# ============================================================
# VPC Outputs
# ============================================================

output "vpc_id" {
  description = "ID of the AWS VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = module.vpc.private_subnet_ids
}

output "nat_gateway_id" {
  description = "ID of the NAT Gateway"
  value       = module.vpc.nat_gateway_id
}

# ============================================================
# EKS Outputs
# ============================================================

output "cluster_name" {
  description = "Name of the EKS cluster"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "API endpoint of the EKS cluster"
  value       = module.eks.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  description = "Base64 encoded EKS cluster CA certificate"
  value       = module.eks.cluster_certificate_authority_data
  sensitive   = true
}

output "node_group_name" {
  description = "Name of the EKS managed node group"
  value       = module.eks.node_group_name
}

output "ebs_csi_addon_version" {
  description = "Installed EBS CSI add-on version"
  value       = module.eks.ebs_csi_addon_version
}