variable "deployment_name" {
  type        = string
  description = "Deployment name, will be used as a suffix in the k8s resource names and labels"
}

variable "image_tag" {
  type        = string
  default     = "latest"
  description = "Image tag used for pgpool2"
}

variable "port" {
  type        = number
  default     = 80
  description = "Port number to listen on"
}

variable "namespace" {
  type        = string
  default     = "helper"
  description = "(Optional) Namespace that pgpool2 will be deployed in"
}

