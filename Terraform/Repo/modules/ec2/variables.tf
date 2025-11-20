variable "instance_type" {
    type = string
    default = "t3.micro" 

}

locals {
  instance_ami = "ami-0e6a50b0059fd2cc3"

  
}

output "instance_id" {
  description = "The ID of the EC2 instance is"
  value = aws_instance.this.id
}