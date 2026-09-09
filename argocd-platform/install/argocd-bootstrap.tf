resource "helm_release" "argocd_bootstrap" {
  name      = "argocd-bootstrap"
  namespace = var.argocd_namespace

  chart = "${path.module}/../bootstrap"

  create_namespace = false

  depends_on = [
    helm_release.argocd
  ]
}