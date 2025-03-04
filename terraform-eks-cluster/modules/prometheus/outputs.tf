output "prometheus_service_url" {
  value = helm_release.prometheus.status[0].url
}

output "prometheus_service_port" {
  value = helm_release.prometheus.status[0].port
}