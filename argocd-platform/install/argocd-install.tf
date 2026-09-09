resource "kubernetes_namespace_v1" "argocd" {
  metadata {
    name = var.argocd_namespace

    labels = {
      purpose     = "gitops"
      managed-by  = "terraform"
      environment = "lab"
    }
  }
}

resource "helm_release" "argocd" {
  name      = "argocd"
  namespace = kubernetes_namespace_v1.argocd.metadata[0].name

  repository = "oci://ghcr.io/argoproj/argo-helm"
  chart      = "argo-cd"
  version    = var.argocd_chart_version

  create_namespace = false

  depends_on = [
    kubernetes_namespace_v1.argocd
  ]
}