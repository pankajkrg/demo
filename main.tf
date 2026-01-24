# -------------------------------
# PROVIDER
# -------------------------------
provider "aws" {
  region = "ap-south-1"  # Change to your AWS region
}

# -------------------------------
# S3 BUCKET
# -------------------------------
resource "aws_s3_bucket" "example" {
  bucket = "my-unique-bucket-12345"  # Must be globally unique
  acl    = "private"
}

# -------------------------------
# SECURITY GROUP
# -------------------------------
resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow SSH and HTTP"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # SSH access from anywhere
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # HTTP access
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
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

# -------------------------------
# OUTPUTS
# -------------------------------
output "s3_bucket_name" {
  value = aws_s3_bucket.example.bucket
}

output "ec2_instance_public_ip" {
  value = aws_instance.web.public_ip
}

