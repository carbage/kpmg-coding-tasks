availability_zones = ["eu-west-2a", "eu-west-2b"]

web_subnets = [
  {
    name       = "web-1"
    cidr_block = "10.0.1.0/24"
  },
  {
    name       = "web-2"
    cidr_block = "10.0.2.0/24"
  }
]

app_subnets = [
  {
    name       = "app-1"
    cidr_block = "10.0.11.0/24"
  },
  {
    name       = "app-2"
    cidr_block = "10.0.12.0/24"
  }
]

data_subnets = [
  {
    name       = "data-1"
    cidr_block = "10.0.21.0/24"
  },
  {
    name       = "data-2"
    cidr_block = "10.0.22.0/24"
  }
]

vpc = {
  name       = "VPC"
  cidr_block = "10.0.0.0/16"
}

web_server = {
  name          = "Web Server"
  ami           = "ami-0fc841be1f929d7d1"
  instance_type = "t2.micro"
  script        = "scripts/install_apache.sh"
}

database = {
  allocated_storage   = 10
  engine              = "mysql"
  engine_version      = "8.0.20"
  instance_class      = "db.t2.micro"
  multi_az            = true
  name                = "mydb"
  username            = "username"
  password            = "password"
  skip_final_snapshot = true
}