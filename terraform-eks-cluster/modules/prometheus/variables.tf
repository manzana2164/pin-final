variable "prometheus_release_name" {
  description = "The name of the Prometheus Helm release"
  type        = string
  default     = "prometheus"
}

variable "prometheus_namespace" {
  description = "The Kubernetes namespace to deploy Prometheus"
  type        = string
  default     = "monitoring"
}

variable "prometheus_values" {
  description = "Custom values for the Prometheus Helm chart"
  type        = map(any)
  default     = {}
}