resource "kubernetes_storage_class_v1" "gp3" {
  metadata {
    name = "gp3"

    annotations = {
      "storageclass.kubernetes.io/is-default-class" = "true"
    }

    labels = {
      managed-by  = "terraform"
      environment = var.environment
      platform    = local.platform_name
    }
  }

  storage_provisioner    = "ebs.csi.aws.com"
  reclaim_policy         = "Delete"
  volume_binding_mode    = "WaitForFirstConsumer"
  allow_volume_expansion = true

  parameters = {
    type      = "gp3"
    encrypted = "true"
  }
}

resource "kubernetes_namespace_v1" "jenkins" {
  metadata {
    name = local.namespaces.jenkins

    labels = {
      managed-by  = "terraform"
      environment = var.environment
      platform    = local.platform_name
      component   = "jenkins"
    }
  }
}

resource "kubernetes_namespace_v1" "tekton" {
  metadata {
    name = local.namespaces.tekton

    labels = {
      managed-by  = "terraform"
      environment = var.environment
      platform    = local.platform_name
      component   = "tekton"
    }
  }
}

resource "kubernetes_namespace_v1" "argocd" {
  metadata {
    name = local.namespaces.argocd

    labels = {
      managed-by  = "terraform"
      environment = var.environment
      platform    = local.platform_name
      component   = "argocd"
    }
  }
}

resource "kubernetes_namespace_v1" "observability" {
  metadata {
    name = local.namespaces.observability

    labels = {
      managed-by  = "terraform"
      environment = var.environment
      platform    = local.platform_name
      component   = "observability"
    }
  }
}
resource "helm_release" "jenkins" {
  name       = "jenkins"
  namespace  = kubernetes_namespace_v1.jenkins.metadata[0].name

  repository = "https://charts.jenkins.io"
  chart      = "jenkins"

  create_namespace = false

  values = [
    file("${path.module}/jenkins-values.yaml")
  ]

  depends_on = [
    kubernetes_namespace_v1.jenkins,
    kubernetes_storage_class_v1.gp3
  ]
}