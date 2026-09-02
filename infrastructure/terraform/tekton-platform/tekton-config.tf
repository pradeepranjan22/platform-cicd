resource "kubernetes_manifest" "tekton_config" {
  depends_on = [
    helm_release.tekton_operator
  ]

  manifest = {
    apiVersion = "operator.tekton.dev/v1alpha1"
    kind       = "TektonConfig"

    metadata = {
      name = "config"
    }

    spec = {
      profile = "basic"

      targetNamespace = var.tekton_pipeline_namespace
    }
  }
}