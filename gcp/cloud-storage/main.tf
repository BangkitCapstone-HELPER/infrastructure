# Specify the GCP Provider
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
# Create a GCS Bucket
resource "google_storage_bucket" "my_bucket" {
  name     = var.bucket_name
  location = var.region
}
