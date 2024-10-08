resource "aws_iam_instance_profile" "test_profile" {
  name = "java_profile"
  role = aws_iam_role.iam_role.name
}