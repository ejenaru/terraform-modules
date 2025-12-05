output "bucket_arn" {
  description = "ARN del bucket creado"
  value = aws_s3_bucket.this.arn
}

output "bucket_name" {
  description = "bucket name"
  value = aws_s3_bucket.this.bucket
}
