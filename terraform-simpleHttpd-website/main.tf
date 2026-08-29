provider "aws" {
  region = "ap-south-1"
}

# Security Group
resource "aws_security_group" "httpd_sg" {
  name = "httpd-security-group"

  # Allow SSH from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow HTTP from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "httpd_server" {
  ami           = "ami-0f918f7e67a3323f0"
  instance_type = "t3.micro"
  key_name      = "severkey"


  security_groups = [aws_security_group.httpd_sg.name]

  # Run the shell script when EC2 starts
  user_data = file("httpd.sh")

  tags = {
    Name = "simpleHttpd-website"
  }
}

# Show Public IP
output "public_ip" {
  value = aws_instance.httpd_server.public_ip
}