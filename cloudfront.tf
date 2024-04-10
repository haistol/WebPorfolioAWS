resource "aws_cloudfront_origin_access_control" "webportfolio" {
  name                              = "s3-cloudfront-webportfolio"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "webportfolio" {
  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "portfolio.html"
  wait_for_deployment = true

  origin {
    domain_name              = aws_s3_bucket.webportfolio.bucket_regional_domain_name
    origin_id                = aws_s3_bucket.webportfolio.bucket
    origin_access_control_id = aws_cloudfront_origin_access_control.webportfolio.id
  }

  default_cache_behavior {
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD", "OPTIONS"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = aws_s3_bucket.webportfolio.bucket
    cache_policy_id        = "658327ea-f89d-4fab-a63d-7e88639e58f6"


  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}

