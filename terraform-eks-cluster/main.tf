provider "aws" {
  region = var.region
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  subnets         = var.subnets
  vpc_id          = var.vpc_id

  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 2
      min_capacity     = 1

      instance_type = "t2.micro"
      key_name      = var.key_name
    }
  }
}

module "prometheus" {
  source          = "./modules/prometheus"
  release_name    = var.prometheus_release_name
  namespace       = var.prometheus_namespace
}

module "grafana" {
  source          = "./modules/grafana"
  release_name    = var.grafana_release_name
  namespace       = var.grafana_namespace
}

module "nginx" {
  source          = "./modules/nginx"
  release_name    = var.nginx_release_name
  namespace       = var.nginx_namespace
}

output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "eks_cluster_name" {
  value = module.eks.cluster_name
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