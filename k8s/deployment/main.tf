locals {
  namespace = "helper"
  common_labels = {
    app = "helper"
  }
}

provider "kubernetes" {
    config_context_cluster   = "minikube"
}