provider "aws" {
  region = "us-east-1"
}
resource "aws_vpc" "my_test_vpc" {
    cidr_block = "10.0.0.0/24"
    instance_tenancy = "default"
    tags = {
      "Name" = "my_test_vpc"
    }
}
resource "aws_subnet" "subnet_a" {
    vpc_id = var.vpc
    cidr_block = "10.0.0.0/26"
    tags = {
      "Name" = "subnet_a"
    }
}
resource "aws_subnet" "subnet_b" {
    vpc_id = var.vpc
    cidr_block = "10.0.0.64/26"
    tags = {
      "Name" = "subnet_b"
    }
}

resource "aws_subnet" "subnet_c" {
    vpc_id = var.vpc
    cidr_block = "10.0.0.128/26"
    tags = {
      "Name" = "subnet_c"
    }
}

resource "aws_subnet" "subnet_d" {
    vpc_id = var.vpc
    cidr_block = "10.0.0.192/26"
    tags = {
        "Name" = "subnet_d"
    }
}

resource "aws_internet_gateway" "my_Igway" {
    vpc_id = var.vpc
    tags = {
        Name = "my_Igway"
    }
}
resource "aws_route_table" "my_test_route" {
    vpc_id = var.vpc
    route = []
    tags = {
        Name = "my_test_route"
    }
  
}
resource "aws_route_table_association" "a" {
    subnet_id = aws_subnet.subnet_a.id
    route_table_id = aws_route_table.my_test_route.id
  
}
resource "aws_route_table_association" "b" {
    subnet_id = aws_subnet.subnet_b.id
    route_table_id = aws_route_table.my_test_route.id
  
}

output "vpc_id" {
    value =  var.vpc
}
output "aws_internet_gateway" {
    value = aws_internet_gateway.my_Igway.id
}