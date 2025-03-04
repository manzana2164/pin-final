resource "helm_release" "grafana" {
  name       = var.release_name
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  namespace  = var.namespace

  set {
    name  = "admin.password"
    value = var.admin_password
  }

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }
}

output "grafana_url" {
  value = "http://${helm_release.grafana.name}.${var.namespace}.svc.cluster.local"
}