#Create EC2 Instance
resource "aws_instance" "web_server" {
  count = length(var.availability_zones)

  ami                    = var.web_server.ami
  instance_type          = var.web_server.instance_type
  availability_zone      = var.availability_zones[count.index]
  vpc_security_group_ids = [aws_security_group.webserver-sg.id]
  subnet_id              = aws_subnet.web-subnet[count.index].id
  user_data              = file(var.web_server.script)

  tags = {
    Name = var.web_server.name
  }

}