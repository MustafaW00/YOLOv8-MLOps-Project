resource "helm_release" "traefik" {
  name             = "traefik"
  repository       = "https://traefik.github.io/charts"
  chart            = "traefik"
  version          = "39.0.8"
  namespace        = "traefik"
  create_namespace = true

  values = [yamlencode({
    service = {
      annotations = {
        "service.beta.kubernetes.io/aws-load-balancer-type" = "nlb"
      }
    }
  })]
}

resource "helm_release" "cert_manager" {
  name             = "cert-manager"
  repository       = "oci://quay.io/jetstack/charts"
  chart            = "cert-manager"
  namespace        = "cert-manager"
  create_namespace = true
  version          = "v1.21.3"


  values = [yamlencode({
    serviceAccount = {
      annotations = {
        "eks.amazonaws.com/role-arn" = module.cert_manager_irsa.role_arn
      }
    }
  })]
  set = [{
    name  = "crds.enabled"
    value = "true"
  }]
}
