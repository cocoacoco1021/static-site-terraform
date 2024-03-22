resource "aws_cloudfront_function" "basic_auth" {
  name    = "${var.project}-${var.environment}-basic-auth-function"
  runtime = "cloudfront-js-1.0"
  comment = "${var.project}-${var.environment}-basic-auth-function"
  publish = true
  code    = file("${path.module}/files/basic-auth.js")
}