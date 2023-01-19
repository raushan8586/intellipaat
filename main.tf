terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.50.0"
    }
  }
}

provider "aws" {
  region     = "ap-southeast-1"
  access_key = "******"
  secret_key = "******"
}


resource "aws_vpc" "intellipaat-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "intellipaat-vpc"
  }
}

resource "aws_subnet" "intellipaat-subnet" {
  vpc_id     = aws_vpc.intellipaat-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "intellipaat-subnet"
  }
}






