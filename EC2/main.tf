resource "aws_security_group" "public_sg" {
  vpc_id = var.vpc-id
  ingress {
    description = "Allow SSH from anywhere"
    from_port   = var.ssh-port
    to_port     = var.ssh-port
    protocol    = "tcp"
    cidr_blocks = [var.any-where-ip-ec2]
  }
  ingress {
    description = "Allow HTTP from anywhere"
    from_port   = var.http-port
    to_port     = var.http-port
    protocol    = "tcp"
    cidr_blocks = [var.any-where-ip-ec2]
  }
  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.any-where-ip-ec2]
  }
  tags = {
    Name = "shoaib-public-sg"
  }

}
resource "aws_key_pair" "public_key" {
  key_name   = "shoaib-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCMdDz2LstAGiDxovBh145ORQs7XHJxiPMEJ2kkzwc1g/cCwdx+NCq2QgWYeAv9EvXxxqhfJd0I5LRKeIG/x2ppDjX9vVKpIWd7y2NqR+BHqx4D+T8n1UuoYLAX4VVVxaNxmxrZgNPZWX79K9FIZtPfoVLU03kjht6UUVw45WFrlR6io7kIkmbPE98qo6ma5zJY/RQ8m8HoLiok16OSn+HvWXSvAQP0LLT1p2cz2X9Xb6o0ZEBiV6szu50ajKFyLiv8bhWpnBk3F3uwaJ4tecDEcmRaR5B/i9rrITK5V9EZMUWGW5VeET+hewaJbq57UR18PevpsxsgD+Zm41rbetkN rsa-key-20260724" # Must be .pub (OpenSSH format)
}

resource "aws_instance" "web_instance" {
  ami                         = var.amz-ami
  instance_type               = var.instance-type
  source_dest_check           = false
  subnet_id                   = var.public-subnet-1-id
  associate_public_ip_address = true

  # Fixed reference to match aws_key_pair.public_key above
  key_name               = aws_key_pair.public_key.key_name
  vpc_security_group_ids = [aws_security_group.public_sg.id]

  user_data = <<-EOF
#!/bin/bash
yum update -y
yum install nginx -y
systemctl enable nginx
systemctl start nginx
echo "<h1>Welcome to Shoaib's Web Server</h1>" > /usr/share/nginx/html/index.html
EOF

  tags = {
    Name = "shoaib-server01"
  }
}

resource "aws_ami_from_instance" "golden-Ami" {
  name               = "terraform-example"
  source_instance_id = aws_instance.web_instance.id

  tags = {
    Name = "shoaib-golden-ami"
  }
}