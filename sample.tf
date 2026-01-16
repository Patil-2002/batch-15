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
  ami = "ami-0ecb62995f68bb549"
  instance_type = "t3.micro"
  vpc_security_group_ids = "sg-0ae44f0b95760a73a"
  key_name = "rsa"
  availability_zone = "us-east-1a"
  tags = {
    "name" = "myinstance"
  }


}
