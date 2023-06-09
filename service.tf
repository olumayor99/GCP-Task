# Create a Kubernetes Service
resource "kubernetes_service" "nginx_service" {
  metadata {
    name      = "nginx-service"
    namespace = kubernetes_namespace.nginx_namespace.metadata.0.name
  }

  spec {
    selector = {
      app = "nginx-app"
    }

    port {
      protocol   = "TCP"
      port       = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}
