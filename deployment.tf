# Create a Kubernetes Deployment
resource "kubernetes_deployment" "nginx_deployment" {
  metadata {
    name      = "nginx-deployment"
    namespace = kubernetes_namespace.nginx_namespace.metadata.0.name
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "nginx-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "nginx-app"
        }
      }

      spec {
        container {
          name  = "nginx-container"
          image = "nginx:latest"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}
