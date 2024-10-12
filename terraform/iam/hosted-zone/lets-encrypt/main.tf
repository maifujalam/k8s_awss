resource "aws_iam_policy" "lets-encrypt" {
  name   = "lets-encrypt_policy"
  path   = "/"
  policy = file("lets-encrypt-policy.json")
}
