resource "aws_security_group" "lb_sg" {

  vpc_id = var.vpc-id

  ingress {
    description = "Allow HTTP traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.any-where-ip]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.any-where-ip]
  }

  tags = {
    Name = "shoaib-lb-sg"
  }
}

resource "aws_lb_target_group" "target_group" {
  name     = "shoaib-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc-id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

resource "aws_lb" "public_lb" {
  name               = "shoaib-lb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [aws_security_group.lb_sg.id]

  subnets = [
    var.public-subnet-1-id,
    var.public-subnet-2-id
  ]

  tags = {
    Environment = "production"
  }
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.public_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}