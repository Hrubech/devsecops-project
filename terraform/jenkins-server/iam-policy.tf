resource "aws_iam_role_policy_attachment" "iam_policy" {
  role = aws_iam_role.devsecops_iam_role.name
  # Just for testing purpose, don't try to give administrator access
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}