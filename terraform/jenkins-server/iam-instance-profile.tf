resource "aws_iam_instance_profile" "instance_profile" {
  name = "jenkins-instance-profile"
  role = aws_iam_role.devsecops_iam_role.name
}