resource "aws_db_subnet_group" "db-subnet-gp" {

  subnet_ids = [var.private-subnet-1-id, var.private-subnet-2-id]

  tags = {
    Name = "shoaib-subnet-gp"
  }
}
resource "aws_security_group" "db_sg" {

  name        = "shoaib-db-sg"
  description = "Allow MySQL from EC2"
  vpc_id      = var.vpc-id

  ingress {
    description = "MySQL"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [
      var.prv-machine-sg
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Database Security Group"
  }
}

resource "aws_db_instance" "mysql" {

  identifier = "shoaib-mysql"

  allocated_storage = 20
  storage_type      = "gp3"

  engine         = "mysql"
  engine_version = "8.0"

  instance_class = "db.t3.micro"

  db_name  = "shoaibdb"
  username = var.db-username
  password = var.db-password

  db_subnet_group_name   = aws_db_subnet_group.db-subnet-gp.name
  vpc_security_group_ids = [aws_security_group.db_sg.id]

  publicly_accessible = false
  multi_az            = false

  skip_final_snapshot = true

  tags = {
    Name = "Shoaib MySQL"
  }
}