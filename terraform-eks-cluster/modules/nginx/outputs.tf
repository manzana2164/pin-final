output "nginx_service_url" {
  value = helm_release.nginx.status[0].url
}