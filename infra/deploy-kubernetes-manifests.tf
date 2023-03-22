# Deploy Kubernetes resources.
resource "null_resource" "deploy_kubernetes_manifests" {
  provisioner "local-exec" {
    interpreter = ["bash", "-exc"]
    command     = "chmod +x deploy-kubernetes-manifests.sh;./deploy-kubernetes-manifests.sh ${var.resource_name_suffix}"
  }
  depends_on = [
    resource.google_project_iam_member.gke_mcs_importer_iam_binding
  ]
}
