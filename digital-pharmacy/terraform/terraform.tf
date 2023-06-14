terraform {
  required_providers {
    aws = "~> 4.22.0"
  }
  backend "s3" {}
}

provider "aws" {}