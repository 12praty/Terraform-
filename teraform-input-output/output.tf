output "instance_public_ip" {
  description = "Public IP of EC2 instance"
  value       = aws_instance.telsko_ec2.public_ip
}

output "instance_id" {
  description = "Instance ID"
  value       = aws_instance.telsko_ec2.id
}

output "private_key_file" {
  description = "Location of generated private key"
  value       = local_sensitive_file.private_key.filename
}