terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.15.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.1"
    }
  }

  backend "s3" {
    bucket         	   = "premeks"
    key              	 = "state/terraform.tfstate"
    region         	   = "us-west-2"
    dynamodb_table  = "eksstatefile"
  }

}

provider "aws" {
  region = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}
