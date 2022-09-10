provider "aws" {
  region = "us-east-1"
}

variable "region" {
  default     = "us-east-1"
  description = "AWS Region"
}

variable "ami" {
  default     = "ami-090fa75af13c156b4"
  description = "Amazon Machine Image ID for Ubuntu Server 20.04"
}

variable "type" {
  default     = "t2.micro"
  description = "Size of VM"
}

resource "aws_instance" "Web" {
  ami           = var.ami
  instance_type = var.type
  tags = {
    Name = "Pipeline-Test-EC2"
  }
}

output "ec2_instance_publicip" {
  description = "EC2 Instance Public IP"
  value       = aws_instance.Web.public_ip
}

output "Web_EC2_Public_DNS" {
  description = "Public DNS URL of an EC2 Instance"
  value       = "http://${aws_instance.Web.public_dns}"
}
