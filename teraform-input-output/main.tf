# Generate private SSH key
resource "tls_private_key" "telsko_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create AWS key pair using generated public key
resource "aws_key_pair" "telsko_key" {
  key_name   = var.key_name
  public_key = tls_private_key.telsko_key.public_key_openssh
}

# Save private key locally
resource "local_sensitive_file" "private_key" {
  filename        = "${path.module}/telsko_key.pem"
  content         = tls_private_key.telsko_key.private_key_pem
  file_permission = "0400"
}

# Create EC2 instance
resource "aws_instance" "telsko_ec2" {
  ami           = "ami-0f918f7e67a3323f0"
  instance_type = var.instance_type
  key_name      = aws_key_pair.telsko_key.key_name

  tags = {
    Name = "telsko-ec2"
  }
}