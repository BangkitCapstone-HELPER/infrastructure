variable "project_id" {
  description = "Google Project ID."
  type        = string
  default     = "serantau"
}

variable "region" {
  description = "Google Cloud region"
  type        = string
  default     = "asia-southeast1"
}


provider "google" {
  project = var.project_id
  region  = var.region
}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.22.0"
    }
  }
}
