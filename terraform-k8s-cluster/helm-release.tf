resource "helm_release" "cert_manager" {
  name      = "cert-manager"
  namespace = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart     = "cert-manager"
  version   = "v1.13.1"  # Specify the desired version
  create_namespace = true

  set {
    name  = "prometheus.enabled"
    value = "false"
  }

  set {
    name  = "webhook.timeoutSeconds"
    value = "4"
  }
}

resource "helm_release" "nginx_ingress" {
  name      = "nginx-ingress"
  namespace = "nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart     = "ingress-nginx"
  create_namespace = true

  set {
    name  = "controller.publishService.enabled"
    value = "true"
  }
}

resource "helm_release" "kube_prometheus" {
  name      = "kube-prometheus"
  namespace = "monitoring"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart     = "kube-prometheus-stack"
  create_namespace = true
}