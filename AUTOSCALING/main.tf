resource "aws_security_group" "shoaib-prv" {
  description = "Allow traffic from public machines"
  vpc_id      = var.vpc-id

  ingress {
    description     = "allow traffic from public machines"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [var.shoaib-lb]
  }
  egress {
    description = "allow all outbound traffic"
    from_port   = 0

    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.any_where_ip_asg]
  }
  tags = {
    Name = "shoaib-prv-sg"
  }
}
resource "aws_launch_template" "launch_template" {

  image_id      = var.Image-Id
  instance_type = "t2.micro"

  network_interfaces {
    subnet_id                   = var.private-subnet-1-id
    associate_public_ip_address = false
    security_groups             = [aws_security_group.shoaib-prv.id]
  }
}

resource "aws_autoscaling_group" "asg" {

  name = "shoaib-asg"

  desired_capacity = 2
  min_size         = 2
  max_size         = 4

  vpc_zone_identifier = [
    var.private-subnet-1-id
  ]

  target_group_arns = [
    var.target_group
  ]

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = "$Latest"
  }

  health_check_type = "ELB"

  tag {
    key                 = "shoaib"
    value               = "ASG-Instance"
    propagate_at_launch = true
  }
}