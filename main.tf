provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket        = "gk-state-file-cicd"
  force_destroy = true
}

resource "aws_dynamodb_table" "users" {
  name         = "users_dev-cicd"
  billing_mode = "PAY_PER_REQUEST"

  hash_key  = "userId"
  range_key = "createdAt"

  attribute {
    name = "userId"
    type = "S"
  }

  attribute {
    name = "createdAt"
    type = "S"
  }
}
