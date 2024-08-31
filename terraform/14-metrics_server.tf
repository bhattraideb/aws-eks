resource "helm_release" "metrics_server" {
  name = "metrics-server"

  repository = "https://kubernetes-sigs.github.io/metrics-server/"
  chart      = "metrics-server"
  namespace  = "kube-system"
  version    = "3.12.1" # https://registry.terraform.io/providers/hashicorp/helm/latest

  values = [file("${path.module}/templates/metrics_server.yml")]

  depends_on = [aws_eks_node_group.general]
}