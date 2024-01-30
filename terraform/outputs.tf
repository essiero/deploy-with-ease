# What outputs allows you to do is, when you run your terraform code, you can have it specify values in the terminal for you. In the end, it gives you kind of a domain.

output "website_url" {
  description = "URL of the S3 Bucket Website"
  value = "http://${aws_s3_bucket.bucket.bucket}.s3-website-${var.aws_region}.amazonaws.com"
}