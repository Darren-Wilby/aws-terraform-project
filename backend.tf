#terraform {
# backend "s3" {
#  bucket         = "nc-darren-s3-bucket" # Value must be unique
# key            = "global/s3/terraform.tfstate"
#region         = "eu-west-2"
# dynamodb_table = "nc-darren-dynamodb" # Value must be unique
#  encrypt        = true
# }
#}

resource "aws_s3_bucket" "terraform_state" {
  bucket        = "nc-darren-s3-bucket" # Same as bucket name in backend block
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "terraform_state_versioning" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_sse" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "nc-darren-dynamodb" # Same as DB name in backend block
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
