data "aws_iam_policy_document" "webportfolio" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.webportfolio.arn}/*"]
    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }
    condition {
      test     = "StringEquals"
      variable = "aws:SourceArn"
      values   = [aws_cloudfront_distribution.webportfolio.arn]
    }
  }
}