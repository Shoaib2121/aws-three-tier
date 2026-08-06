variable "vpc-id" {
  description = "this is ID "
}
variable "any-where-ip-ec2" {
  default = "0.0.0.0/0"

}
variable "public-subnet-1-id" {
  description = "this is public subnet 1 ID "
}
variable "amz-ami" {
  default = "ami-004f790b835b26145"

}
variable "instance-type" {
  default = "t2.micro"

}
variable "private-subnet-1-id" {
  description = "this is private subnet 1 ID "
}
variable "ssh-port" {
  default = 22
}
variable "http-port" {
  default = 80
}

