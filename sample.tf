terraform {
  backend "s3" {
    bucket = "batch15.coms"
    region = "us-east-1"
    key = "tfstate"
    
  }
}
provider "aws" {
  region = "us-east-1"
  
}
resource "aws_instance" "myinstance" {
  ami = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = ["sg-0ae44f0b95760a73a"]
  key_name = var.key_name
  availability_zone = "us-east-1a"
  tags = {
    "name" = "myinstance"
  }
  
}

variable "ami_id" {
  default = "ami-0ecb62995f68bb549"
  
}
variable "instance_type" {
  default = "t3.micro"
  
}
variable "key_name" {
  default = "rsa"
  
}