output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "prometheus_service_url" {
  value = module.prometheus.service_url
}

output "grafana_service_url" {
  value = module.grafana.service_url
}

output "nginx_service_url" {
  value = module.nginx.service_url
}