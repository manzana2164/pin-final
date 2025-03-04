variable "grafana_release_name" {
  description = "The name of the Grafana Helm release"
  type        = string
}

variable "grafana_namespace" {
  description = "The namespace where Grafana will be deployed"
  type        = string
  default     = "monitoring"
}