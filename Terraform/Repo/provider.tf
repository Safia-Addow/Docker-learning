terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.21.0"
    }
  }

  backend "s3" {
   bucket="safiaaddow-terraform1"
   key = "terraform.tfstate"
   region ="us-west-1"
   dynamodb_table = "mybackend"
    encrypt        = true
  }
}

provider "aws" {
  # Configuration options
  region = "us-west-1"
}

