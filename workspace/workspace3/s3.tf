terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
# Configure the AWS Provider
provider "aws" {
  region = "eu-west-2"
  access_key = "AKIAX3LNWYOGIVRPHOXY"
  secret_key = "9sHJCSQjMRbhwNrKy3YJC5Vni2GSAwPziovr5aUh"
}


resource "aws_s3_bucket" "example" {
  bucket = "my-terraff-test-bucket-0001-sanket2"
  
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
