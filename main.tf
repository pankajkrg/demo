# -------------------------------
# PROVIDER
# -------------------------------
provider "aws" {
  region = "ap-south-1"  # Change to your AWS region
}
# -------------------------------
# EC2 INSTANCE
# -------------------------------
resource "aws_instance" "web" {
  ami           = "ami-04808bdb94be6720e"  
  instance_type = "t3.mimcro"

  tags = {
    Name = "Terraform-HCP-EC2"
  }
}


