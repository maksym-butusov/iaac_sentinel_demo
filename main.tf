provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "ubuntu" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  availability_zone           = "${var.aws_region}b"
  associate_public_ip_address = "true"
  tags = {
    Name  = var.name
    owner = "vitalii_varenyk@epam.com"
    ttl   = "-1"
  }
}

resource "aws_s3_bucket" "Devops" {
  bucket = "devops-44439483843894839"
  acl    = "private"

  tags = {
    Name        = "var.name"
    Environment = "Dev"
  }
}