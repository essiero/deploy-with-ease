resource "null_resource" "sync" {
  triggers = {
    bucket_id = aws_s3_bucket.bucket.id
  }

  provisioner "local-exec" {
    command = "aws s3 sync ../useragent/dist s3://${aws_s3_bucket.bucket.id} --delete" # this would run this command: sync whatever is in my hypothetical /dist file with s3://:id and then delete whatever...else?
    # You can add a bunch of commands and have it do whatever you want.
  }
}