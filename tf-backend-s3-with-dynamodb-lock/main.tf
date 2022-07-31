terraform {
  backend "s3" {
    bucket = "niranjan-tf-backend"
    key    = "env/dev/second"
    region = "us-east-1"
    dynamodb_table = "tf-state-lock"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0022f774911c1d690"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
