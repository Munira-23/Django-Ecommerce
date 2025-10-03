provider "aws" {
  region = "eu-north-1"  # you can change to your preferred AWS region
}

resource "aws_instance" "app_server" {
  ami           = "ami-0a716d3f3b16d290c" # Ubuntu 22.04 LTS in us-east-1
  instance_type = "t3.micro"

  tags = {
    Name = "django-ec2"
  }
}
