variable "vpc-id" {
  description = "this is ID "

}
variable "private-subnet-1-id" {
  description = "this is private subnet 1 ID "

}
variable "public-subnet-1-id" {
  description = "this is public subnet 1 ID "

}
variable "shoaib-lb" {
  description = "this is load balancer security group ID"
  type        = string
}
variable "any_where_ip_asg" {
  default = "0.0.0.0/0"
}
variable "Image-Id" {
  description = "this is image id for autoscalling"
}
variable "target_group" {
  description = "this is tg"
}