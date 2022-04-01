terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.8.0"
    }
  }

  backend "s3" {
    bucket         = "ytil-tfstates"
    key            = "workspaces/default"
    region         = "eu-central-1"
    dynamodb_table = "tfstates-lock-table"
  }
}

provider "aws" {
  region = "eu-central-1"
}

locals {
  web_instance_type_map = {
    stage = "t3.micro"
    prod  = "t3.large"
  }

  web_instance_count_map = {
    stage = 1
    prod  = 2
  }
}

resource "aws_instance" "example" {
  ami           = "ami-035e017c94c3cbe9c"
  instance_type = local.web_instance_type_map[terraform.workspace]
  count         = local.web_instance_count_map[terraform.workspace]
}

resource "aws_instance" "example2" {
  for_each      = toset(["first", "second"])
  ami           = "ami-035e017c94c3cbe9c"
  instance_type = "t3.micro"
  tags = {
    Name = each.value
  }
  lifecycle {
    create_before_destroy = true
  }
}

output "public_dns" {
  value       = aws_instance.example.*.public_dns
  description = "The public DNS address of the web server"
}