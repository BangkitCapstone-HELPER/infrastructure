variable "project_id" {
  description = "Google Project ID."
  type        = string
  default     = "serantau"
}

variable "bucket_name" {
  description = "GCS Bucket name. Value should be unique ."
  type        = string
  default     = "serantau"
}

variable "region" {
  description = "Google Cloud region"
  type        = string
  default     = "asia-southeast1"
}
