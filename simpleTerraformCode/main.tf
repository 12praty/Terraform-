provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "linux_vm" {
  ami           = "ami-06a83a7a581c729a9"
  instance_type = "t3.micro"

  key_name = "Ec2-key-pair"

  security_groups = ["default"]

  tags = {
    Name = "Telusko-Server"
  }
}