resource "aws_eks_cluster" "soldier" {
  name     = "soldier"
  role_arn = aws_iam_role.eksRole.arn

  vpc_config {
    subnet_ids = [
      data.aws_subnets.subnets.ids[0],
      data.aws_subnets.subnets.ids[1],
    ]
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEKSVPCResourceController,
  ]
}

output "endpoint" {
  value = aws_eks_cluster.soldier.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.soldier.certificate_authority[0].data
}
