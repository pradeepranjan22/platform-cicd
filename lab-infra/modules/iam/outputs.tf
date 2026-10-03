output "eks_cluster_role_arn" {
  description = "ARN of the IAM role used by the EKS control plane"
  value       = aws_iam_role.eks_cluster.arn
}

output "eks_node_role_arn" {
  description = "ARN of the IAM role used by EKS worker nodes"
  value       = aws_iam_role.eks_node.arn
}

output "ebs_csi_role_arn" {
  description = "ARN of the IAM role used by the EBS CSI driver"
  value       = aws_iam_role.ebs_csi.arn
}