resource "kubernetes_namespace_v1" "tekton_ci" {
  metadata {
    name = "tekton-ci"

    labels = {
      purpose     = "ci"
      managed-by  = "terraform"
      environment = "lab"
    }
  }

  depends_on = [
    aws_eks_cluster.this
  ]
}

resource "kubernetes_secret_v1" "dockerhub" {
  metadata {
    name      = "dockerhub-secret"
    namespace = kubernetes_namespace_v1.tekton_ci.metadata[0].name
  }

  type = "kubernetes.io/dockerconfigjson"

  data = {
    ".dockerconfigjson" = jsonencode({
      auths = {
        "https://index.docker.io/v1/" = {
          username = var.dockerhub_username
          password = var.dockerhub_access_token
        }
      }
    })
  }

  depends_on = [
    kubernetes_namespace_v1.tekton_ci
  ]
}

resource "kubernetes_service_account_v1" "ci" {
  metadata {
    name      = "ci-serviceaccount"
    namespace = kubernetes_namespace_v1.tekton_ci.metadata[0].name

    labels = {
      purpose    = "ci"
      managed-by = "terraform"
    }
  }

  secret {
    name = kubernetes_secret_v1.dockerhub.metadata[0].name
  }

  depends_on = [
    kubernetes_namespace_v1.tekton_ci
  ]
}