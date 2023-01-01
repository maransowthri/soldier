resource "aws_eks_node_group" "workers" {
  cluster_name    = aws_eks_cluster.soldier.name
  node_group_name = "workers"
  node_role_arn   = aws_iam_role.eksRole.arn
  subnet_ids = [
    data.aws_subnets.subnets.ids[0],
    data.aws_subnets.subnets.ids[1],
  ]
  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]
}
