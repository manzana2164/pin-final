resource "helm_release" "prometheus" {
  name       = var.release_name
  namespace  = var.namespace
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"
  version    = "14.0.0"  # Specify the desired version

  values = [
    file("${path.module}/values.yaml")
  ]
}

resource "kubectl_manifest" "prometheus_service" {
  manifest = {
    apiVersion = "v1"
    kind       = "Service"
    metadata = {
      name      = "prometheus"
      namespace = var.namespace
    }
    spec = {
      type = "ClusterIP"
      ports = [
        {
          port       = 9090
          targetPort = 9090
        }
      ]
      selector = {
        app = "prometheus"
      }
    }
  }
}