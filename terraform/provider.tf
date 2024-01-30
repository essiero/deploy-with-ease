terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws" # this would be what we call an argument - like a key
      version = "5.34.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = var.aws_region # this will now equate to whatever we set as the default value for this variable. If we didn't set a default value, it would prompt us to add a default value.
}
