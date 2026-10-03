output "environment" {
  description = "Kubernetes platform environment"
  value       = var.environment
}

output "cluster_name" {
  description = "EKS cluster consumed from AWS Foundation"
  value       = data.terraform_remote_state.aws_foundation.outputs.cluster_name
}

output "jenkins_namespace" {
  description = "Jenkins namespace"
  value       = kubernetes_namespace_v1.jenkins.metadata[0].name
}

output "tekton_namespace" {
  description = "Tekton namespace"
  value       = kubernetes_namespace_v1.tekton.metadata[0].name
}

output "argocd_namespace" {
  description = "Argo CD namespace"
  value       = kubernetes_namespace_v1.argocd.metadata[0].name
}

output "observability_namespace" {
  description = "Observability namespace"
  value       = kubernetes_namespace_v1.observability.metadata[0].name
}

output "storage_class" {
  description = "Default GP3 StorageClass"
  value       = kubernetes_storage_class_v1.gp3.metadata[0].name
}
output "jenkins_release" {
  description = "Jenkins Helm release name"
  value       = helm_release.jenkins.name
}
