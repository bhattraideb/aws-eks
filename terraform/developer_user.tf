resource "aws_iam_user" "eks_developer_user" {
  name = var.eks_developer_user
}

resource "aws_iam_policy" "eks_developer_policy" {
  name = "AmazonEKSDeveloperPolicy"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "eks:DescribeCluster",
        "eks:ListClusters"
      ],
      "Resource": "*"
    }
  ]
}
POLICY
}

resource "aws_iam_user_policy_attachment" "developer_user_role_attachment" {
  policy_arn = aws_iam_policy.eks_developer_policy.arn
  user       = aws_iam_user.eks_developer_user.name
}

resource "aws_eks_access_entry" "developer" {
  cluster_name      = aws_eks_cluster.eks_cluster.name
  principal_arn     = aws_iam_user.eks_developer_user.arn
  kubernetes_groups = ["my-viewer"]
}