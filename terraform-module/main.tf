module "ec2" {
  source        = "./modules/ec2"
  ami_id        = "ami-06a83a7a581c729a9"
  instance_type = "t3.micro"
  name          = "My_server"
}

module "s3" {
  source = "./modules/s3"

  bucket_name = "pratyush-terraform-s3-20260830"
}