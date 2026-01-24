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
  ami           = "ami-04808bdb94be6720e"  # Amazon Linux 2 AMI in ap-south-1
  instance_type = "t3.micro"
  security_groups = [aws_security_group.web_sg.name]

  tags = {
    Name = "Terraform-HCP-EC2"
  }
}


