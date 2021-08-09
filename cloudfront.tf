#############################################
# CloudFront
#############################################

resource "aws_cloudfront_distribution" "cloudfront_distribution" {

  price_class      = "PriceClass_All"
  retain_on_delete = true
  enabled          = true
  is_ipv6_enabled  = false
  comment          = var.cloudfront_distribution_info.origin_domain_name
  tags             = var.resource_tags

  origin {
    domain_name = var.cloudfront_distribution_info.origin_domain_name
    origin_id   = var.cloudfront_distribution_info.origin_domain_name

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "match-viewer"
      origin_ssl_protocols   = ["TLSv1"]
    }
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
    cached_methods   = ["GET", "HEAD", "OPTIONS"]
    target_origin_id = var.cloudfront_distribution_info.origin_domain_name

    forwarded_values {
      query_string = false
      headers      = []

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    compress               = true
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400

    lambda_function_association {
      event_type   = "viewer-response"
      lambda_arn   = module.lambda_edge.lambda_function_qualified_arn
      include_body = false
    }
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

output "cloudfront_url" {
  value = aws_cloudfront_distribution.cloudfront_distribution.domain_name
}