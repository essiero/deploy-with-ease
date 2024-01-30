# The type of this object is a resource. It has two labels: "aws_s3_bucket" (which references this resource when we use it elsewhere in our code) and "bucket" (a name we choose that is local in our code)
# 

resource "aws_s3_bucket" "bucket" {
  bucket = "useragent-info-parser-bucket5432"
  force_destroy = true # These are commands...

  tags = {
    Name        = "useragent-info-parser-bucket5432"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "s3:GetObject",
        Effect    = "Allow",
        Resource  = "${aws_s3_bucket.bucket.arn}/*", # 
        Principal = "*" # this is where you would put your username if you wanted only yourself to have access to the bucket. "*" means everyone can view your files.
      }
    ]
  })
} 
# with aws you can set up a bucket to host a website

resource "aws_s3_bucket_website_configuration" "bucket_website_configuration" {
  bucket = aws_s3_bucket.bucket.id 
  index_document {
    suffix = "index.html" # when you land in my app, you should be looking for the index.html file to load
  }
  error_document {
    key = "error.html" # if you have an error it will show this page
  }
}

# by default, if you don't unblock public access, it will be blocked
resource "aws_s3_bucket_public_access_block" "bucket_public_access_block" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}