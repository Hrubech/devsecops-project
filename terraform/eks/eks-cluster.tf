resource "aws_eks_cluster" "eks_cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.EKSClusterRole.arn
  vpc_config {
    subnet_ids         = [data.aws_subnet.subnet.id, aws_subnet.public_subnet_2.id]
    security_group_ids = [data.aws_security_group.sg_default.id]
  }

  version = 1.28

  depends_on = [aws_iam_role_policy_attachment.AmazonEKSClusterPolicy]
}