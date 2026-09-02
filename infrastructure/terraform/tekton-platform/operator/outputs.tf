output "eks_cluster_name" {
  description = "EKS cluster used for Tekton"
  value       = data.aws_eks_cluster.this.name
}

output "tekton_operator_release" {
  description = "Tekton Operator Helm release"
  value       = helm_release.tekton_operator.name
}

output "tekton_operator_version" {
  description = "Tekton Operator version"
  value       = helm_release.tekton_operator.version
}

output "tekton_operator_namespace" {
  description = "Tekton Operator namespace"
  value       = var.tekton_namespace
}