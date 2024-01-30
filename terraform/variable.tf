variable "aws_region" {
  description = "The AWS region where the S3 bucket will be created."
  type        = string
#   default     = "us-east-1" # if you don't specify a default value, the terminal will prompt you to define the value. But then you have to remember it. Or: you can define it in a .tfvars file.
}

