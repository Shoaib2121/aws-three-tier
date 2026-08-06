variable "vpc-id" {
  description = "VPC ID"
}

variable "public-subnet-1-id" {
  description = "Public Subnet 1 ID"
}

variable "public-subnet-2-id" {
  description = "Public Subnet 2 ID"
}

variable "any-where-ip" {
  description = "Allow traffic from anywhere"
  default     = "0.0.0.0/0"
}