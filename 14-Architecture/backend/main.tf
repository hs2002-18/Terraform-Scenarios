provider "aws" {
  region = "ap-south-1"
}
resource "aws_s3_bucket" "my_bucket" {
  bucket = "aws-terraform-architecture-s3-bucket"
}
resource "aws_dynamodb_table" "my_table" {
  name     = "terraform-locks"
  hash_key = "LockID"
  billing_mode = "PAY_PER_REQUEST"


  attribute {
    name = "LockID"
    type = "S"
  }
}