locals {
    bucket_name ="webportfolio-92115812-cp"
}

resource "aws_s3_bucket" "webportfolio" {
    bucket = local.bucket_name
}

resource "aws_s3_object" "webportfolio-html" {
  bucket       = aws_s3_bucket.webportfolio.bucket
  key          = "portfolio.html"
  source       = "content/html/portfolio.html"
  content_type = "text/html"
}

resource "aws_s3_object" "webportfolio-png" {
    for_each        = fileset("content/img/", "*.png")
    bucket          = aws_s3_bucket.webportfolio.bucket
    key             = each.value
    source          = "content/img/${each.value}"
    content_type    = "image/png"
}

resource "aws_s3_object" "webportfolio-jpg" {
    for_each        = fileset("content/img/", "*.jpg")
    bucket          = aws_s3_bucket.webportfolio.bucket
    key             = each.value
    source          = "content/img/${each.value}"
    content_type    = "image/jpg"
}

resource "aws_s3_object" "webportfolio-css" {
  bucket       = aws_s3_bucket.webportfolio.bucket
  key          = "style.css"
  source       = "content/css/style.css"
  content_type = "text/css"
}

resource "aws_s3_bucket_policy" "webportfolio-policy" {
  bucket = aws_s3_bucket.webportfolio.bucket
  policy = data.aws_iam_policy_document.webportfolio.json
}