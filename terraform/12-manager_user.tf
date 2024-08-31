data "aws_caller_identity" "current" {}

resource "aws_iam_role" "eks_admin_role" {
  name = "${local.project}-${var.eks_name}-admin"

  assume_role_policy = <<POLICY
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": "sts:AssumeRole",
        "Principal": {
          "AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        }
      }
    ]
  }
  POLICY
}

resource "aws_iam_policy" "eks_admin_policy" {
  name = "AmazonEKSAdminPolicy"

  policy = <<POLICY
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": [
          "eks:*"
        ],
        "Resource": "*"
      },
      {
        "Effect": "Allow",
        "Action": "iam:PassRole",
        "Resource": "*",
        "Condition": {
          "StringEquals": {
            "iam:PassedToService": "aks.amazonaws.com"
          }
        }
      }
    ]
  }
  POLICY
}

resource "aws_iam_role_policy_attachment" "eks_admin_policy_attachment" {
  policy_arn = aws_iam_policy.eks_admin_policy.arn
  role       = aws_iam_role.eks_admin_role.name
}

resource "aws_iam_user" "eks_manager" {
  name = var.eks_manager
}

resource "aws_iam_policy" "eks_manager_assume_admin" {
  name = "AmazonEKSAssumeAdminPolicy"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "sts:AssumeRole"
      ],
      "Resource": "${aws_iam_role.eks_admin_role.arn}"
    }
  ]
}
POLICY
}

resource "aws_iam_user_policy_attachment" "eks_manager_policy_attachment" {
  policy_arn = aws_iam_policy.eks_manager_assume_admin.arn
  user       = aws_iam_user.eks_manager.name
}

resource "aws_eks_access_entry" "manager_access" {
  cluster_name      = aws_eks_cluster.eks_cluster.name
  principal_arn     = aws_iam_role.eks_admin_role.arn
  kubernetes_groups = ["admin-group"]
}
