provider "aws" {
  region = var.aws_region
}

# resource "aws_instance" "ubuntu" {
#   ami                         = var.ami_id
#   instance_type               = var.instance_type
#   availability_zone           = "${var.aws_region}b"
#   associate_public_ip_address = "true"
#   tags = {
#     owner = "email@example.com"
#   }
# }

# resource "aws_s3_bucket" "Devops" {
#   bucket = "devops-44439483843894839"
#   acl    = "private"

#   tags = {
#     Environment = "Dev"
#     owner = "email@example.com"
#   }
# }
resource "null_resource" "run" {

 provisioner "local-exec" {

    command = "/bin/bash aws --version"
  }
}
