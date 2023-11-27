terraform {
    
  backend "remote" {
    organization = "freebandz-learn"
    workspaces {
      name = "Example-Workspace"
    }
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
  region = "us-east-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-07b36ea9852e986ad"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}