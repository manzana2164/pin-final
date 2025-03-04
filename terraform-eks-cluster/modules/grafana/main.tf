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

  set {
    name  = "persistence.enabled"
    value = "true"
  }

  set {
    name  = "persistence.size"
    value = "10Gi"
  }

  depends_on = [helm_release.prometheus]
}