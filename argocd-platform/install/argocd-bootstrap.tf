resource "helm_release" "argocd_bootstrap" {
  name      = "argocd-bootstrap"
  namespace = var.argocd_namespace

  chart = "${path.module}/../bootstrap"

  create_namespace = false

  values = [
    yamlencode({
      bootstrapChecksum = filesha256(
        "${path.module}/../bootstrap/templates/platform-ci-catalog.yaml"
      )
    })
  ]

  depends_on = [
    helm_release.argocd
  ]
}