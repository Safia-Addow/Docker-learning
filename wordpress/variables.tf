variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-2" # London
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ssh_key_name" {
  description = "Name of existing AWS key pair for SSH access"
  type        = string
}

variable "wordpress_db_name" {
  type    = string
  default = "wordpress"
}

variable "wordpress_db_user" {
  type    = string
  default = "wp_user"
}

variable "wordpress_db_password" {
  type        = string
  description = "DB password for WordPress user. For real usage, set via terraform variables or secrets manager."
  sensitive   = true
  default     = "ChangeMe123!"
}

variable "wordpress_admin_email" {
  type    = string
  default = "admin@example.com"
}

variable "tags" {
  type = map(string)
  default = {
    Project = "terraform-wordpress"
    Env     = "dev"
  }
}
