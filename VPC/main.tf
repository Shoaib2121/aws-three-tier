resource "aws_vpc" "main-vpc" {
  cidr_block = var.vpc-cidr
  tags = {
    Name = "shoaib-vpc"
  }
}

resource "aws_internet_gateway" "shoaib-igw" {
  vpc_id = aws_vpc.main-vpc.id

  tags = {
    Name = "shoaib-igw"
  }
}
resource "aws_default_route_table" "prt-rt" {
  default_route_table_id = aws_vpc.main-vpc.default_route_table_id

  tags = {
    Name = "shoaib-prv-rt"
  }
}
# data "aws_instance" "nat_instance" {
#   instance_id = var.public-instance
# }


# resource "aws_route" "private_internet_route" {
#   route_table_id         = aws_default_route_table.prt-rt.id
#   destination_cidr_block = "0.0.0.0/0"
#   network_interface_id   = data.aws_instance.nat_instance.network_interface_id
# }
# resource "aws_route_table" "public_rt" {
#   vpc_id = aws_vpc.main-vpc.id
#     route {
#         cidr_block = "0.0.0.0/0"
#         gateway_id = aws_internet_gateway.shoaib-igw.id
#     }
#   tags = {
#     Name = "shoaib-public-rt"
#   }
# }
# resource "aws_subnet" "public_subnet_1" {
#   vpc_id                  = aws_vpc.main-vpc.id
#   cidr_block              = "10.0.1.0/24"
#   availability_zone       = var.region-1a
#   map_public_ip_on_launch = true

#   tags = {
#     Name = "shoaib-public-subnet1"
#   }
# }
# resource "aws_subnet" "public_subnet_2" {
#   vpc_id                  = aws_vpc.main-vpc.id
#   cidr_block              = "10.0.2.0/24"
#   availability_zone       = var.region-1b
#   map_public_ip_on_launch = true

#   tags = {
#     Name = "shoaib-public-subnet2"
#   }
# }
# resource "aws_subnet" "private_subnet_1" {
#   vpc_id                  = aws_vpc.main-vpc.id
#   cidr_block              = "10.0.3.0/24"
#   availability_zone       = var.region-1a


#   tags = {
#     Name = "shoaib-private-subnet1"
#   }
# }
# resource "aws_subnet" "private_subnet_2" {
#   vpc_id                  = aws_vpc.main-vpc.id
#   cidr_block              = "10.0.4.0/24"
#   availability_zone       = var.region-1b


#   tags = {
#     Name = "shoaib-private-subnet2"
#   }
# }
# resource "aws_route_table_association" "public_rt_assoc_1" {
#   subnet_id      = aws_subnet.public_subnet_1.id
#   route_table_id = aws_route_table.public_rt.id
# }
# resource "aws_route_table_association" "public_rt_assoc_2" {
#     subnet_id      = aws_subnet.public_subnet_2.id
#     route_table_id = aws_route_table.public_rt.id

# }
# resource "aws_route_table_association" "private_rt_assoc_1" {
#     subnet_id      = aws_subnet.private_subnet_1.id
#     route_table_id = aws_default_route_table.prt-rt.id

# }
# resource "aws_route_table_association" "private_rt_assoc_2" {
#     subnet_id      = aws_subnet.private_subnet_2.id
#     route_table_id = aws_default_route_table.prt-rt.id

# }










