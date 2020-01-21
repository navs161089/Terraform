variable "aws_region" {
  type = string
  default = "us-east-1"
}

variable "inst_ami" {
  type = string
  default = "ami-00068cd7555f543d5"
}
variable "instype" {
  type = string
  default = "t2.micro"
}
variable "keypair" {
  type = string
  default = "py-boto3"
}
