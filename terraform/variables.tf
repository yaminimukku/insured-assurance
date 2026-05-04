variable "aws_region" {
  default = "eu-west-2"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "terraform.pem"
}

variable "my_ip" {
  description = "31.94.14.20/32"
}