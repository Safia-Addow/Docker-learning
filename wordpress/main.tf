terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.4.0"
}

provider "aws" {
  region = var.aws_region
}

# Use a Free Tier eligible Ubuntu AMI
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

# Random ID for security group name
resource "random_id" "sg_id" {
  byte_length = 4
}

# Default VPC
data "aws_vpc" "default" {
  default = true
}

# Fetch first public subnet
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

data "aws_subnet" "public" {
  id = data.aws_subnets.default.ids[0]
}

# Security group - HTTP only (no SSH needed)
resource "aws_security_group" "web_sg" {
  name        = "wordpress-sg-${random_id.sg_id.hex}"
  description = "Allow HTTP/HTTPS"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTPS"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}

# Free Tier EC2 instance
resource "aws_instance" "wp" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro" # Free Tier eligible
  subnet_id                   = data.aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true

  tags = merge(var.tags, { Name = "terraform-wordpress-free" })

  # Install WordPress via user_data
  user_data = templatefile("${path.module}/userdata.tpl", {
    db_name     = var.wordpress_db_name
    db_user     = var.wordpress_db_user
    db_password = var.wordpress_db_password
    admin_email = var.wordpress_admin_email
  })
}

# Outputs
output "wordpress_public_ip" {
  value       = aws_instance.wp.public_ip
  description = "Public IP of the WordPress instance"
}

output "wordpress_url" {
  value       = "http://${aws_instance.wp.public_ip}/"
  description = "URL to access WordPress"
}
