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

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.intellipaat-vpc.id

  tags = {
    Name = "intellipaat_igw"
  }
}

resource "aws_security_group" "intellipaat-sg" {
  name        = "intellipaat-sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.intellipaat-vpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "intellipaat-sg"
  }
}






