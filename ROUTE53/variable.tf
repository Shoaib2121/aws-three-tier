variable "hosted_zone_id" {
  description = "Route53 Hosted Zone ID"
}

variable "domain_name" {
  description = "Domain or subdomain name"
}

variable "alb_dns_name" {
  description = "Application Load Balancer DNS Name"
}

variable "alb_zone_id" {
  description = "Application Load Balancer Hosted Zone ID"
}