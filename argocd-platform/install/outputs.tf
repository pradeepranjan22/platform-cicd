output "eks_cluster_name" {
  description = "EKS cluster where Argo CD is installed"
  value       = data.aws_eks_cluster.this.name
}

output "argocd_namespace" {
  description = "Kubernetes namespace containing Argo CD"
  value       = kubernetes_namespace_v1.argocd.metadata[0].name
}

output "argocd_release_name" {
  description = "Helm release name for Argo CD"
  value       = helm_release.argocd.name
}

output "argocd_chart_version" {
  description = "Installed Argo CD Helm chart version"
  value       = helm_release.argocd.version
}

output "argocd_status" {
  description = "Helm release status"
  value       = helm_release.argocd.status
}