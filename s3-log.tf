/** 
# NOTE: Log S3 Bucket
*/

// AWS アカウント ID 参照
data "aws_caller_identity" "current_identity" {}

// ログ保管 S3
resource "aws_s3_bucket" "log" {
  bucket = "${var.project}-${var.environment}-log-bucket"

  tags = {
    Name        = "${var.project}-${var.environment}-log-bucket"
    Environment = var.environment
  }
}

// Log S3 バケット ライフサイクル設定
resource "aws_s3_bucket_lifecycle_configuration" "log" {
  bucket = aws_s3_bucket.log.id

  rule {
    id     = "GLACIER_390Days_Expiration_1110Days"
    status = "Enabled"

    transition {
      days          = 390
      storage_class = "GLACIER"
    }

    expiration {
      days = 1110
    }
  }
}

// S3 パブリックアクセス設定
resource "aws_s3_bucket_public_access_block" "log" {
  bucket = aws_s3_bucket.log.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

// S3 暗号化
resource "aws_s3_bucket_server_side_encryption_configuration" "log" {
  bucket = aws_s3_bucket.log.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}