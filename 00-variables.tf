variable "availability_zones" {
  type    = list(string)
  default = ["eu-west-2a"]
}

variable "web_subnets" {
  type = list(map(string))
  default = [
    {
      name       = "example"
      cidr_block = "10.0.1.0/24"
    }
  ]
}

variable "app_subnets" {
  type = list(map(string))
  default = [
    {
      name       = "example"
      cidr_block = "10.0.11.0/24"
    }
  ]
}

variable "data_subnets" {
  type = list(map(string))
  default = [
    {
      name       = "example"
      cidr_block = "10.0.21.0/24"
    }
  ]
}

variable "vpc" {
  type = map(string)
  default = {
    name       = "VPC"
    cidr_block = "10.0.0.0/16"
  }
}

variable "web_server" {
  type = map(string)
  default = {
    name          = "Web Server"
    ami           = "ami-0d5eff06f840b45e9"
    instance_type = "t2.micro"
    script        = "scripts/install_apache.sh"
  }
}

variable "database" {
  type = map(any)
  default = {
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
}