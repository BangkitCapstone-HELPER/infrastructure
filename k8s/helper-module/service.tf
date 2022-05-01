resource "kubernetes_service" "backend" {
  metadata {
    name      = "helper-${var.deployment_name}"
    namespace = var.namespace
    labels    = local.common_labels
  }

  spec {
    port {
      name     = "http"
      port = var.port
      protocol  = "TCP"
      target_port = "80"
    }

    selector = local.common_labels

  }
}