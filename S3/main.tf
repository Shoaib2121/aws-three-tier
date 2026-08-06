resource "aws_s3_bucket" "s3_bucket" {

  bucket = "shoaib-bucket-dev-2026-xyz"

  tags = {
    Name        = "shoaib"
    Environment = "Dev"
  }
}