resource "aws_db_instance" "database" {

  name                = var.database.name
  allocated_storage   = var.database.allocated_storage
  engine              = var.database.engine
  engine_version      = var.database.engine_version
  instance_class      = var.database.instance_class
  multi_az            = var.database.multi_az
  username            = var.database.username
  password            = var.database.password
  skip_final_snapshot = var.database.skip_final_snapshot

  db_subnet_group_name   = aws_db_subnet_group.default.id
  vpc_security_group_ids = [aws_security_group.database-sg.id]
}

resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = aws_subnet.data-subnet[*].id

  tags = {
    Name = "DB Subnet Group"
  }
}