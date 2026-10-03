locals {
  platform_name = "kubernetes-platform"

  common_tags = {
    environment = var.environment
    managed_by  = "terraform"
    platform    = local.platform_name
  }

  namespaces = {
    jenkins       = "jenkins"
    tekton        = "tekton-ci"
    argocd        = "argocd"
    observability = "observability"
  }
}