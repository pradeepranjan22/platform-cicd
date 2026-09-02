output "eks_cluster_name" {
  description = "EKS cluster managed by this Tekton platform configuration"
  value       = data.aws_eks_cluster.this.name
}

output "tekton_operator_release" {
  description = "Tekton Operator Helm release name"
  value       = helm_release.tekton_operator.name
}

output "tekton_operator_version" {
  description = "Installed Tekton Operator version"
  value       = helm_release.tekton_operator.version
}

output "tekton_operator_namespace" {
  description = "Namespace containing the Tekton Operator"
  value       = var.tekton_namespace
}

output "tekton_pipeline_namespace" {
  description = "Namespace containing Tekton Pipeline components"
  value       = var.tekton_pipeline_namespace
}