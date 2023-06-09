# Create a Kubernetes namespace
resource "kubernetes_namespace" "career_namespace" {
  metadata {
    name = "career-namespace"
  }
}

# Add "depends_on" rule to the namespace
resource "null_resource" "namespace_dependency" {
  depends_on = [google_container_cluster.career_cluster, kubernetes_namespace.career_namespace]
}