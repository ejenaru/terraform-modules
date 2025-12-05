resource "aws_s3_bucket" "this" {
  bucket = var.resource_name
  tags = {
    Name        = var.resource_name
    Environment = var.env
    Application = var.app_name
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_s3_bucket_policy" "s3_policy" {
  bucket = aws_s3_bucket.this.id

  policy = var.policy
}
