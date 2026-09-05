output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.this.id
}

output "eks_cluster_name" {
  value = aws_eks_cluster.this.name
}

output "eks_cluster_endpoint" {
  value = aws_eks_cluster.this.endpoint
}

output "eks_cluster_role_arn" {
  value = aws_iam_role.eks_cluster.arn
}

output "eks_node_role_arn" {
  value = aws_iam_role.eks_node.arn
}

output "eks_node_group_name" {
  value = aws_eks_node_group.this.node_group_name
}

output "ebs_csi_addon_version" {
  description = "Installed EBS CSI add-on version"
  value       = aws_eks_addon.ebs_csi.addon_version
}

output "ebs_csi_role_arn" {
  description = "IAM role used by the EBS CSI driver"
  value       = aws_iam_role.ebs_csi.arn
}


output "gp3_storage_class" {
  description = "Default EBS CSI gp3 StorageClass"
  value       = kubernetes_storage_class_v1.gp3.metadata[0].name
}