data "aws_iam_policy_document" "lbc_policy_doc" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["pods.eks.amazonaws.com"]
    }

    actions = [
      "sts:AssumeRole",
      "sts:TagSession"
    ]
  }
}

resource "aws_iam_role" "lbc_role" {
  name               = "${aws_eks_cluster.eks_cluster.name}-aws-lbc"
  assume_role_policy = data.aws_iam_policy_document.lbc_policy_doc.json
}

resource "aws_iam_policy" "lbc_policy" {
  policy = file("./iam_policies/AWSLoadBalancerController.json")
  name   = "AWSLoadBalancerController"
}

resource "aws_iam_role_policy_attachment" "aws_lbc" {
  policy_arn = aws_iam_policy.lbc_policy.arn
  role       = aws_iam_role.lbc_role.name
}

resource "aws_eks_pod_identity_association" "lbc_pod_identity_association" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  namespace       = "kube-system"
  service_account = "aws-load-balancer-controller"
  role_arn        = aws_iam_role.lbc_role.arn
}

resource "helm_release" "aws_lbc" {
  name = "aws-load-balancer-controller"

  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  namespace  = "kube-system"
  version    = "1.8.1"

  set {
    name  = "clusterName"
    value = aws_eks_cluster.eks_cluster.name
  }

  set {
    name  = "serviceAccount.name"
    value = "aws-load-balancer-controller"
  }

  set {
    name  = "vpcId"
    value = aws_vpc.main.id
  }

  depends_on = [helm_release.cluster_autoscaler]
}