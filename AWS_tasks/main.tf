provider "aws" {
  profile = "default"
  region  = "eu-north-1"
}

resource "aws_instance" "appserver" {
  ami           = ""
  instance_type = "t2.micro"
  tags = {
    Name = "AppServerExample"
  }
}