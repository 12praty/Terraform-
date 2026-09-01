resource "aws_instance" "linux_vm" {
  ami           = "ami-0d54604676873b4ec"
  instance_type = var.instance_type

  tags = {
    Name = "Terraform-Server"
  }
}