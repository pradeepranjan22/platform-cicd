data "aws_iam_policy_document" "terraform_state_access" {
  statement {
    sid    = "TerraformStateBucketAccess"
    effect = "Allow"

    actions = [
      "s3:ListBucket"
    ]

    resources = [
      aws_s3_bucket.terraform_state.arn
    ]
  }

  statement {
    sid    = "TerraformStateObjectAccess"
    effect = "Allow"

    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject"
    ]

    resources = [
      "${aws_s3_bucket.terraform_state.arn}/*"
    ]
  }
}

resource "aws_iam_policy" "terraform_state_access" {
  name   = "terraform-state-access"
  policy = data.aws_iam_policy_document.terraform_state_access.json
}

resource "aws_iam_role_policy_attachment" "terraform_state_access" {
  role       = aws_iam_role.terraform_execution.name
  policy_arn = aws_iam_policy.terraform_state_access.arn
}