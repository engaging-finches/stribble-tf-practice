terraform {
  # cloud {
  #     organization = "finches"
  #     workspaces {
  #     name = "finches-tf"
  #     }
  # }
  backend "s3" {
    bucket = "stribble-bucket"
    key    = "terraform.tfstate"
    region = "us-east-1"
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
  region = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-04e5276ebb8451442"
  instance_type = "t2.small"

  tags = {
    Client       = "Internal"
    Project      = "DOB"
    Owner        = "stribble"
    Appliocaiton = "app_server"
    Environment  = "test"
    Test_tag     = "true"
  }
}