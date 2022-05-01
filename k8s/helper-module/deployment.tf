resource "kubernetes_deployment" "backend" {
  metadata {
    name        = "helper-${var.deployment_name}"
    namespace   = var.namespace
    labels      = local.common_labels
  }

  spec {
    replicas = 2

    selector {
      match_labels = local.common_labels
    }

    template {
      metadata {
        labels = local.common_labels
      }

      spec {

        # volume {
        #   name = "pool-hba-conf"
        #   config_map {
        #     name = "pgpool2-${var.deployment_name}"
        #   }
        # }

        container {
          name  = "bangkit-backend"
          image = "docker.io/rweebs/bangkit-backend:${var.image_tag}"

        #   volume_mount {
        #     name       = "pool-hba-conf"
        #     mount_path = "/config"
        #   }

          port {
            name           = "http"
            container_port = var.port
            protocol       = "TCP"
          }

          resources {
            limits = {
              cpu    = "1"
              memory = "512Mi"
            }

            requests = {
              cpu    = "500m"
              memory = "256Mi"
            }
          }

          liveness_probe {
            http_get {
              path = "/docs/index.html"
              port = "80"
            }

            initial_delay_seconds = 30
            timeout_seconds       = 5
            period_seconds        = 10
            success_threshold     = 1
            failure_threshold     = 5
          }

          readiness_probe {
            http_get {
              path = "/docs/index.html"
              port = "80"
            }

            initial_delay_seconds = 5
            timeout_seconds       = 5
            period_seconds        = 5
            success_threshold     = 1
            failure_threshold     = 5
          }

          image_pull_policy = "IfNotPresent"

          security_context {
            run_as_user = 1001
          }
        }

        security_context {
          fs_group = 1001
        }

      }
    }
  }
}
