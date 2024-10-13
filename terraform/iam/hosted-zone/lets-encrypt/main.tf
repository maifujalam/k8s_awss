resource "aws_iam_policy" "lets-encrypt" {
  name   = "lets-encrypt-policy"
  path   = "/"
  policy = file("lets-encrypt-policy.json")
}
resource "aws_iam_policy" "lets-encrypt-policy" {
  name = "RoleForCertManager"
  policy = file("trust-policy.json")
}
