provider "kubernetes" {

  config_path = "~/.kube/config"
  config_context_cluster = "minikube"

}
locals {
  namespace = "helper"
  common_labels = {
    app = "helper"
  }
}