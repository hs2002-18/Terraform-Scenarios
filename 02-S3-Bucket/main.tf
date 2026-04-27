provider "aws"{
    region = "ap-south-1"
}

resource "aws_s3_bucket" "myBucket"{
    bucket = "my-terraform-scenario-bucket"

    tags = {
        Name = "my-terraform-scenario-bucket"
    }
}

resource "aws_s3_bucket_versioning" "versioning" {
    bucket = aws_s3_bucket.myBucket.id
    versioning_configuration {
        status = "Enabled"
    }
}

