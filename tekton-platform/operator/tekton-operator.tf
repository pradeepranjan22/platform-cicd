data "kubectl_file_documents" "tekton_operator" {
  content = file("${path.module}/${var.operator_manifest_file}")
}

resource "kubectl_manifest" "tekton_operator" {
  for_each = data.kubectl_file_documents.tekton_operator.manifests

  yaml_body = each.value
}