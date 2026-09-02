resource "helm_release" "tekton_operator" {
  name             = "tekton-operator"
  namespace        = var.tekton_namespace
  create_namespace = true

  repository = "oci://ghcr.io/tektoncd/operator/charts"
  chart      = "tekton-operator"
  version    = var.tekton_operator_version

  wait          = true
  wait_for_jobs = true
  timeout       = 600
}