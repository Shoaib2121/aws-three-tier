provider "aws" {
  region = var.region
}
module "vpc" {
  source = "./VPC"

}
# public-instance = module.ec2.public-instance


# module "ec2" {
#   source = "./EC2"
#   vpc-id = module.vpc.vpc-id
#   public-subnet-1-id = module.vpc.public-subnet-1-id
#   private-subnet-1-id = module.vpc.private-subnet-1-id
# }

# module "s3" {
#    source = "./S3"
# }






# module "loadbalancer" {
#   source = "./LOADBALANCER"

#   vpc-id = module.vpc.vpc-id
#   public-subnet-1-id = module.vpc.public-subnet-1-id
#   public-subnet-2-id = module.vpc.public-subnet-2-id
# }
# module "autoscaling" {
#   source = "./AUTOSCALING"

#   vpc-id               = module.vpc.vpc-id
#   private-subnet-1-id = module.vpc.private-subnet-1-id
#   public-subnet-1-id  = module.vpc.public-subnet-1-id
#   Image-Id            = module.ec2.Image-Id
#   shoaib-lb           = module.loadbalancer.lb_security_group_id
#   target_group        = module.loadbalancer.target_group_id
# }
# module "route53" {
#   source = "./ROUTE53"

#   hosted_zone_id = "Z10472023S5QQWTA21ZS7"      
#   domain_name    = "shoaib.sherdilitacademy.net"        # Your domain or subdomain

#   alb_dns_name = module.loadbalancer.alb_dns_name
#   alb_zone_id  = module.loadbalancer.alb_zone_id
# }
# module "database" {
#   source = "./DATABASE"
#   private-subnet-1-id = module.vpc.private-subnet-1-id
#   private-subnet-2-id = module.vpc.private-subnet-2-id
#   prv-machine-sg = module.autoscaling.prv-machine-sg

#   vpc-id = module.vpc.vpc-id



# }
# import {
#   to = aws_vpc.my_vpc
#   id = "vpc-0f47a07ba25b3614e" # AWS Console se real VPC ID
# }