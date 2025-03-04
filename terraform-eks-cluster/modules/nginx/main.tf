resource "helm_release" "nginx" {
  name       = var.release_name
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "nginx"
  namespace  = var.namespace

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "service.port"
    value = "80"
  }

  set {
    name  = "service.annotations"
    value = jsonencode({
      "service.beta.kubernetes.io/aws-load-balancer-type" = "nlb"
    })
  }
}