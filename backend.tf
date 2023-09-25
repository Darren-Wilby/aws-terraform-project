terraform {
  required_version = ">= 1.0.0"

  backend "s3" {
    bucket         = "aws-network-terraform-bucket"
    key            = "global/s3/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "aws-network-terraform-dynamodb"
    encrypt        = true
  }
}