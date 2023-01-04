terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  shared_credentials_file = "../aws/credentials"
  region     = "us-east-1"
  default_tags {
    tags = {
      Environment = "Production"
      Owner       = "Ops"
    }
  }
}