variable "nginx_release_name" {
  description = "The name of the NGINX Helm release"
  type        = string
}

variable "nginx_namespace" {
  description = "The namespace where NGINX will be deployed"
  type        = string
  default     = "default"
}