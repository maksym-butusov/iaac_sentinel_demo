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
# resource "null_resource" "example35454" {
#   provisioner "local-exec" {
#     command = <<-EOT
#        aws --version
#        aws sts get-caller-identity
#     EOT
#   }
# }

# resource "null_resource" "example2" {
#   provisioner "local-exec" {
#     command = <<-EOT
#        uname -a
#        lsb_release
#        curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip
#        unzip awscliv2.zip
#        ./aws/install
#        aws --version
#     EOT
#   }
# }
resource "aws_cloudformation_stack" "network" {
  name = "test-vpc-for-importing"

  parameters = {
    VPCCidr = "192.168.0.0/27"
  }

  template_body = <<STACK
{
  "Parameters" : {
    "VPCCidr" : {
      "Type" : "String",
      "Default" : "192.168.0.0/27",
      "Description" : "Enter the CIDR block for the VPC. Default is 192.168.0.0/27."
    }
  },
  "Resources" : {
    "myVpc": {
      "Type" : "AWS::EC2::VPC",
      "Properties" : {
        "CidrBlock" : { "Ref" : "VPCCidr" },
        "Tags" : [
          {"Key": "Name", "Value": "Primary_CF_VPC"}
        ]
      }
    }
  }
}
STACK
}

