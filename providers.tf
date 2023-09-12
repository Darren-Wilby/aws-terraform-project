terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.13.1"
    }
  }
  required_version = ">= 1.0.0"
}

provider "aws" {
  region = "eu-west-2"
}
