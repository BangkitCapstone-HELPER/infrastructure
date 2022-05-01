terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.9.0"
    }
  }
}
provider "kubernetes" {
  config_path = "~/.kube/config"
  config_context_cluster = "minikube"

}

resource "kubernetes_namespace" "helper" {

  metadata {
    name = "helper"
  }

}