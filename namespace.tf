# Create a Kubernetes namespace
resource "kubernetes_namespace" "nginx_namespace" {
  metadata {
    name = var.namespace
  }
}